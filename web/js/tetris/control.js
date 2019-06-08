//플레이버튼 끄고 스톱버튼 띄움
function offPlayButton()
{
    $('#playbutton').prop('disabled', true);

    $('#stopbutton').prop('disabled', false).css('display', 'inline');
}

//플레이버튼 켜고 스톱버튼 없앰
function onPlayButton()
{
    $('#playbutton').prop('disabled', false);

    $('#stopbutton').prop('disabled', true).css('display', 'none');
}

//플레이 버튼 눌림
function playButtonClicked() 
{
    newGame();

    offPlayButton();
}

function stopButtonClicked()
{
    endGame();

    onPlayButton();
}

function newGame() 
{
    clearAllIntervals();
    intervalRender = setInterval( render, 30 );
    init();
    newShape();
    lose = false;
    interval = setInterval( tick, 400 );
}

function endGame()
{
    clearAllIntervals();
    if(window.confirm('점수를 서버에 등록하시겠어요?'))
    {
        $('#score').val(score);
        $('#upload_form').submit();
    }

    $('#score_box').html('점수: 0');
    score = 0;
}