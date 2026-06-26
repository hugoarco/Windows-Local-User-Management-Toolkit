function Identificacionusuarios {

    $usuariosalumnos = @(
        "Hugo Arcones "
           )

$eleccionUsuario = Read-Host ("Introduzca su nombre de usuario")

    if ($usuariosalumnos -contains $eleccionUsuario   ) {
        write-Host ("El usuario esta en el sistema y puede continuar ") -ForegroundColor Green
    }

    else {
        write-Host ("El usuario no esta en el sistema y no puede continuar") -ForegroundColor Red
        exit
    }

}

catch {
    write-Host ("Error")
    return
}

}

function menu   {
$Opcionmenu = 0 
while ($Opcionmenu -ne 5) {
write-Host ("Seleccione acontinuación una opcion del menu (solo numero) ") -ForegroundColor Blue
write-Host ("1 Inicio") -ForegroundColor Blue
write-Host ("2 Creacion") -ForegroundColor Blue
write-Host ("3 Comprobacion ") -ForegroundColor Blue
write-Host ("4 Salir ") -ForegroundColor Blue

$Opcionmenu = Read-Host ("Seleccione una opcion del menu")

switch ($Opcionmenu) {
    1 {Inicio}
    2 {Creacionusuarios}
    3 {Comprobacion}
    4 {Borradousuario}
    5 {Salir}
    default {Write-Host "Opcion no valida" -ForegroundColor Red  } 
    }
}

}

function Inicio {
write-Host ("Bienvenido al script en esta parte te explicaremos que hace cada función") -ForegroundColor Blue
write-Host ("1. inicio - explicación detallada de las funcionalidades del script de gestión de usuarios") -ForegroundColor Blue
write-Host ("2. creación de usuario - introduce el nombre y la contraseña para crear un nuevo usuario en el sistema") -ForegroundColor Blue
write-Host ("3. comprobación de usuario - verifica si un usuario específico existe en el sistema") -ForegroundColor Blue
write-Host ("4. listado de usuarios - muestra todos los usuarios del sistema o busca uno en concreto") -ForegroundColor Blue

$Sino = Read-Host ("El usuario $($eleccionUsuario) quiere permanecer en incio (Responda con si no)")

    
try {
  if ($Sino -eq "Si") {
        write-Host ("Ok permanceras en la seccion ") -ForegroundColor Green
    }
    else {
        write-Host ("Ok el usuario no quiere permanecer en el script")  -ForegroundColor Red
    return 
        }
    
    
}
  catch {
    write-Host ("Error")
  }
}


function Creacionusuarios {
    $nombre =read-Host ("Introduzca el nombre de usuario que quiera crear ")
 New-LocalUser -Name $nombre 
 write-Host ("Usuario creado Corrrectamente") -ForegroundColor Green

}

function Comprobacion {
    $Comprprueba = Read-Host ("Introduzca su nombre de usuario ")
    Get-LocalUser $Comprprueba

}


function Borradousuario {
$nombre =read-Host ("Introduzca el nombre de usuario que quiera borrar ")
Remove-LocalUser -Name $nombre
write-Host ("Usuario borrado Correctamente") -ForegroundColor Green


}



function Salir {

    $Salida = Read-Host ("El usuario desea salir del script")
        if  ( $Salida -eq "Si") {
            write-Host ("Ok permanceras en el script") -ForegroundColor Green

        }

        else {
            write-Host ("El usuario no quiere permanecer en el script ok  ") -ForegroundColor Red
            exit
        }

}

Identificacionusuarios
menu
