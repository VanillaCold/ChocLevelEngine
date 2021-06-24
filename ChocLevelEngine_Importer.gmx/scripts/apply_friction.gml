///apply_friction(speed variable, friction variable)

var svar = argument[0]
var fvar = argument[1]

if svar > 0
    {
    svar -= fvar
    if svar < 0{svar = 0}
    }
if svar < 0
    {
    svar += fvar
    if svar > 0{svar = 0}
    }
return(svar)
