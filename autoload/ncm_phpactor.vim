
func! ncm_phpactor#get_working_dir()
    if exists('g:ncm_phpactor_cwd')
        return g:ncm_phpactor_cwd
    endif
    let filedir=expand('%:p:h')
    let wdir=fnamemodify(findfile('vendor/autoload.php', filedir . ';', 1), ':h:h')
    if wdir == ""
        return getcwd()
    else
        return wdir
    endif
endfunc

