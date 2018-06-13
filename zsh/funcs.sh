egron () {
    awk -F '[= "]' '{ print $5 }';
}
clip () {
    xclip -i -selection clipboard;
}

