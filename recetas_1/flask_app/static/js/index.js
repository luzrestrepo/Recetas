var formLogin = document.getElementById('formLogin'); //obtenniendo el formulario

formLogin.onsubmit = function(event) {
    event.preventDefault(); /*previene el comportamiento por defaul de mi formulario */

    var formulario = new formData(formLogin)

    fetch("/login", { method: 'POST', body: formulario })
        .then(response => response.json())
        .then(data => {
            console.log(data)

            if (data, message == "correcto") {
                window.location.href = "/dashboard"
            }
            var mensajeAlerta = document.getElementById('mensajeAlerta');
            mensajeAlerta.innerText = data.message;
            mensajeAlerta.classList.add('alert')
            mensajeAlerta.classList.add('alert-danger')
        });
}