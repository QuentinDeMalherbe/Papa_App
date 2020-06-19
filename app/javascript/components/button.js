
function submitForms() {
  const Forms = document.querySelectorAll('.simple_form')
  Forms.forEach(form =>
    form.submit()
  );
}

const buttonPolice = document.getElementById('button-police')
const buttonPrimary = document.getElementById('button-primary')
const buttonContact = document.getElementById('button-contact')

function disabledButton() {

}

export { submitForms }

// [...inputs].forEach(function (input) {
//   if ((input.value != "") && (input.index == [...inputs].count - 1)) { btnPolice.removeAttribute("disabled") }
//   else if (input.value != "") { }
//   else { btnPolice.setAttribute("disabled") }
//   ;
// });
