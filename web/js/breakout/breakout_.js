let canvas = window.document.getElementById('canvas');
let context = canvas.getContext('2d');

const ballRadius = 10; //공의 반지름입니다.
const ballColor = 'rgb(139,0,255)'; //공 색깔입니다.

//공의 좌표입니다.
let x = canvas.width/2;
let y = canvas.height-30;

//공의 이동값입니다.
let x_inc = 1.0;
let y_inc = -1.0;

const paddleHeight = 10; //판때기 세로길이
const paddleWidth = 75; //판때기 가로길이
const paddleColor = 'gray'; //판때기 색깔
let paddleX = (canvas.width-paddleWidth)/2; //판때기 좌표
const paddle_inc = 7; //판때기 이동값

//키 인식
let leftPressed = false;
let rightPressed = false;

//스코어입니다.
let score = 0;


//벽돌 관련 수치입니다.
let brickRowCount = 3;
let brickColumnCount = 5;
let brickWidth = 75;
let brickHeight = 20;
let brickPadding = 10;
let brickOffsetTop = 30;
let brickOffsetLeft = 30;
let bricks = [];

const brickColors = ['rgb(255,0,0)','rgb(0,255,0)','rgb(0,0,255)', 'rgb(255,230,0)'];

const watingSecond = 10;

function getBrickColor()
{
    return brickColors[Math.floor(Math.random()*brickColors.length)]
}

//벽돌 깨진 숫자
let broken_count = 0;


//벽돌을 초기화합니다.
function initBricks()
{
    broken_count = 0;

    speedup();

    for(let c = 0; c<brickColumnCount; c++)
    {
        bricks[c] = [];
        for(let r=0; r<brickRowCount; r++)
            bricks[c][r] = {x:0, y:0, status: 1, color: getBrickColor()};
    }
}

function drawBricks()
{
    for(let c=0; c<brickColumnCount; c++)
    {
        for(let r=0; r<brickRowCount; r++)
        {
            if(bricks[c][r].status == 1)
            {
                const brickX = (c*(brickWidth+brickPadding))+brickOffsetLeft; //좌표 계산
                const brickY = (r*(brickHeight+brickPadding))+brickOffsetTop;
                bricks[c][r].x = brickX;
                bricks[c][r].y = brickY;

                context.beginPath();
                context.rect(brickX, brickY, brickWidth, brickHeight);
                context.fillStyle = bricks[c][r].color;
                context.fill();
                context.closePath();
            }
        }
    }
}

//벽돌 충돌을 처리합니다.
function collisionDetection()
{
    for(let c=0; c<brickColumnCount; c++)
        for(let r=0; r<brickRowCount; r++)
        {
            let b = bricks[c][r];
            if(b.status == 1 && x > b.x && x < b.x+brickWidth && y > b.y && y < b.y+brickHeight)
            {
                score += 10;
                y_inc = -y_inc;
                b.status = 0;
                broken_count++;
            }
        }
}


//수치들을 초기화합니다.
function init()
{
    x = canvas.width/2;
    y = canvas.height-30;

    paddleX = (canvas.width-paddleWidth)/2;

    leftPressed = false;
    rightPressed = false;

    initBricks();

    score = 0;

    x_inc = 1.0;



    y_inc = -1.0;
}


//공을 그립니다.
function drawBall()
{
    context.beginPath();
    context.arc(x,y,10,0,Math.PI*2);
    context.fillStyle = ballColor;
    context.fill();
    context.closePath();
}

//판때기를 그립니다.
function drawPaddle()
{
    if(rightPressed && paddleX<canvas.width-paddleWidth)
        paddleX += paddle_inc;
    else if(leftPressed && paddleX>0)
        paddleX -= paddle_inc;

    context.beginPath();
    context.rect(paddleX, canvas.height-paddleHeight, paddleWidth, paddleHeight);
    context.fillStyle = paddleColor;
    context.fill();
    context.closePath();
}


//공 속도 올림
function speedup()
{
    if(x_inc<0)
        x_inc-=0.5;
    else
        x_inc+=0.5;

    if(y_inc<0)
        y_inc-=0.5;
    else
        y_inc+=0.5;
}


//허옇게 칠합니다.
function clear()
{
    context.beginPath();
    context.fillStyle = 'white';
    context.rect(0,0, canvas.width, canvas.height);
    context.fill();
    context.closePath();
}
clear();

//그립니다. 메인 루프입니다.
function draw()
{
    clear();

    $('#score_box').html('점수: '+score);

    drawBricks();
    drawBall();
    drawPaddle();
    collisionDetection();

    //다 부쉈으면
    if(broken_count==brickRowCount*brickColumnCount)
    {
        setTimeout(initBricks, watingSecond*1000); //10초 후에 리스폰
        broken_count=0;
    }


    //양쪽 벽에 부딪히면 방향 전환
    if(x+x_inc > canvas.width-ballRadius || x+x_inc < ballRadius)
        x_inc = -x_inc;
    //위에 부딪히면 방향 전환
    if(y+y_inc < ballRadius)
        y_inc = -y_inc;
    //아래에 부딪히면
    else if(y+y_inc > canvas.height-ballRadius)
        if(x>paddleX && x<paddleX+paddleWidth) //판때기에 부딪히면
        {
            y_inc = -y_inc;
            score++;
        }
        else //떨어지면
        {
            endGame();
        }

    x+=x_inc;
    y+=y_inc;
}


//이벤트 설정
window.onkeydown = function(event)
{
    switch(event.keyCode)
    {
        case 37: leftPressed = true;
            break;
        case 39: rightPressed = true;
            break;
    }
}
window.onkeyup = function(event)
{
    switch(event.keyCode)
    {
        case 37: leftPressed = false;
            break;
        case 39: rightPressed = false;
            break;
    }
}


let drawInterval;

function newGame()
{
    init();
    drawInterval = setInterval(draw, 10);
}

function endGame()
{
    clearAllIntervals();

    onPlayButton();

    if(window.confirm('점수를 서버에 등록하시겠어요?'))
    {
        $('#score').val(score);
        $('#upload_form').submit();
    }
    $('#score_box').html('점수: 0');
}

function clearAllIntervals()
{
    clearInterval(drawInterval);
}