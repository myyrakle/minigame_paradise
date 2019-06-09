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

//시작버튼 이벤트
function onPlayButtonClicked()
{
    newGame();
    offPlayButton();
}

//종료버튼 이벤트
function onStopButtonClicked()
{
    endGame();
    onPlayButton();
}