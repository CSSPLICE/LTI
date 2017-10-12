window.onload = function () {
  var buttons = document.getElementsByTagName('span'),
    result = document.querySelectorAll('.result p')[0],
    clear = document.getElementsByClassName('clear')[0];

  for (var i = 0; i < buttons.length; i++) {
    if (buttons[i].innerHTML === '=') {
      buttons[i].addEventListener("click", calculate(i));
    } else {
      buttons[i].addEventListener("click", addValue(i));
    }
  }

  clear.onclick = function () {
    result.innerHTML = '';
  };

  function addValue(i) {
    return function () {

      result.innerHTML += buttons[i].innerHTML;

    };
  }

  function calculate(i) {
    return function () {
        var final_res = result.innerHTML;


      result.innerHTML = eval(final_res);
    };
  }
};
