const COLS = 10
const ROWS = 20;

let board = [];
let lose;
let interval;
let intervalRender; //렌더링 간격

let current; // 현재 움직이는 블록

let score = 0;

//현재 도형의 위치
let currentX;
let currentY; 

let freezed; //현재 도형이 보드에 붙었는지?

let shapes = [
    [ 1, 1, 1, 1 ],
    [ 1, 1, 1, 0,
      1 ],
    [ 1, 1, 1, 0,
      0, 0, 1 ],
    [ 1, 1, 0, 0,
      1, 1 ],
    [ 1, 1, 0, 0,
      0, 1, 1 ],
    [ 0, 1, 1, 0,
      1, 1 ],
    [ 0, 1, 0, 0,
      1, 1, 1 ]
];

let colors = ['cyan', 'orange', 'blue', 'yellow', 'red', 'green', 'purple'];

document.body.onkeydown = function(event) 
{
    let keys = 
    {
        37: 'left',
        39: 'right',
        40: 'down',
        32: 'rotate'
    };

    switch(event.keyCode)
    {
        case 37: keyPress('left');
            break;
        case 39: keyPress('right');
            break;
        case 40: keyPress('down');
            break;
        case 32: keyPress('rotate');
            break;
    }
};


// 전역변수 'current'에 4x4 블럭을 생성
// 4x4 so as to cover the size when the shape is rotated
function newShape() 
{
    let id = Math.floor( Math.random() * shapes.length );
    let shape = shapes[id]; // maintain id for color filling

    current = [];

    for (let y = 0; y < 4; ++y ) 
    {
        current[ y ] = [];
        for ( let x = 0; x < 4; ++x ) 
        {
            let i = 4 * y + x;
            if ( typeof shape[ i ] != 'undefined' && shape[ i ] ) 
                current[ y ][ x ] = id + 1;
            else 
                current[ y ][ x ] = 0;
        }
    }
    
    // new shape starts to move
    freezed = false;
    // position where the shape will evolve
    currentX = 5;
    currentY = 0;
}

// 보드 초기화
function init() 
{
    for (let y = 0; y < ROWS; ++y ) 
    {
        board[ y ] = [];
        for (let x = 0; x < COLS; ++x )
            board[ y ][ x ] = 0;
    }
}

// 블럭을 내려가게 하면서, 새 블럭을 만들며, 라인을 초기화한다.
function tick() 
{
    if ( valid( 0, 1 ) ) 
        ++currentY;
    
    // 해당 요소가 배치됐을 경우
    else 
    {
        freeze();
        valid(0, 1);
        clearLines();
        if (lose) 
        {
            endGame();
            return false;
        }
        newShape();
    }
}

//현재 블럭을 해당 위치에서 중지시키고 보드에 고정함
function freeze() 
{
    for ( let y = 0; y < 4; ++y ) 
        for ( let x = 0; x < 4; ++x ) 
            if ( current[ y ][ x ] ) 
                board[ y + currentY ][ x + currentX ] = current[ y ][ x ];
            
    freezed = true;
}

// returns rotates the rotated shape 'current' perpendicularly anticlockwise
function rotate(current) 
{
    let newCurrent = [];
    for ( let y = 0; y < 4; ++y ) 
    {
        newCurrent[ y ] = [];
        for ( let x = 0; x < 4; ++x ) 
            newCurrent[ y ][ x ] = current[ 3 - x ][ y ];
    }

    return newCurrent;
}

// 가득 찬 줄이 있는지 확인하고 제거
function clearLines() 
{
    for ( let y = ROWS - 1; y >= 0; --y ) //한줄씩 체크
    {
        let rowFilled = true;
        for ( let x = 0; x < COLS; ++x )  //한칸씩 체크
        {
            if ( board[ y ][ x ] == 0 ) 
            {
                rowFilled = false; //하나라도 비면 없는것
                break;
            }
        }

        if ( rowFilled ) 
        {
            document.getElementById('clearsound').play();
            for ( let yy = y; yy > 0; --yy )
                for ( let x = 0; x < COLS; ++x ) 
                    board[ yy ][ x ] = board[ yy - 1 ][ x ];
            
            ++y;

            score+=10;
            $('#score_box' ).html('점수: '+score);
        }
    }
}

function keyPress( key ) 
{
    switch ( key ) 
    {
        case 'left':
            if ( valid( -1 ) ) 
                --currentX;
            break;

        case 'right':
            if ( valid( 1 ) ) 
                ++currentX;
            break;

        case 'down':
            if ( valid( 0, 1 ) ) 
                ++currentY;
            break;

        case 'rotate':
            let rotated = rotate( current );
            if ( valid( 0, 0, rotated ) ) 
                current = rotated;
            break;

        case 'drop':
            while( valid(0, 1) ) 
                ++currentY;
            tick();
            break;
    }
}

// 이동할 블럭의 위치가 유효한지를 체크
function valid( offsetX, offsetY, newCurrent ) 
{
    offsetX = offsetX || 0;
    offsetY = offsetY || 0;
    offsetX = currentX + offsetX;
    offsetY = currentY + offsetY;
    newCurrent = newCurrent || current;

    for ( let y = 0; y < 4; ++y ) 
    {
        for ( let x = 0; x < 4; ++x ) 
        {
            if ( newCurrent[ y ][ x ] ) 
            {
                if ( typeof board[ y + offsetY ] == 'undefined'
                  || typeof board[ y + offsetY ][ x + offsetX ] == 'undefined'
                  || board[ y + offsetY ][ x + offsetX ]
                  || x + offsetX < 0
                  || y + offsetY >= ROWS
                  || x + offsetX >= COLS ) 
                {
                    if (offsetY == 1 && freezed) 
                    {
                        lose = true;
                        onPlayButton();
                    } 
                    return false;
                }
            }
        }
    }
    return true;
}

function clearAllIntervals()
{
    clearInterval(interval);
    clearInterval(intervalRender);
}