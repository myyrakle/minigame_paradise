let canvas = document.getElementById('gamebox');
let context = canvas.getContext( '2d' );

const W = 300;
const H = 600;

context.fillStyle = 'white';
context.fillRect(0,0, W, H);

const BLOCK_W = W / COLS, BLOCK_H = H / ROWS;

// xy 좌표에 사각형을 그림
function drawBlock( x, y ) 
{
    context.fillRect( BLOCK_W * x, BLOCK_H * y, BLOCK_W - 1 , BLOCK_H - 1 );
    context.strokeRect( BLOCK_W * x, BLOCK_H * y, BLOCK_W - 1 , BLOCK_H - 1 );
}

// 보드와 움직이는 블럭을 그림
function render()
{
    context.fillStyle = 'white';
    context.fillRect(0,0, W, H);

    for ( let x = 0; x < COLS; ++x ) 
        for ( let y = 0; y < ROWS; ++y ) 
            if ( board[ y ][ x ] ) 
            {
                context.strokeStyle = 'black';
                context.fillStyle = colors[board[ y ][ x ]-1];
                drawBlock( x, y );
            }
            // else
            // {
            //     context.strokeStyle = 'ltgray';
            //     context.fillStyle = 'white';
            //     drawBlock( x, y );
            // }     

    context.fillStyle = 'red';
    //context.strokeStyle = 'black';
    for ( let y = 0; y < 4; ++y ) 
        for ( let x = 0; x < 4; ++x ) 
            if ( current[ y ][ x ] ) 
            {
                context.fillStyle = colors[ current[ y ][ x ] - 1 ];
                drawBlock( currentX + x, currentY + y );
            }
}