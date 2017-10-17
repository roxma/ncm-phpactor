
func! ncm_phpactor#get_working_dir()
    if exists('g:ncm_phpactor_cwd') && len(g:ncm_phpactor_cwd)
        return g:ncm_phpactor_cwd
    endif
    let filedir = expand('%:p:h')
    " upward search
    let wdir = findfile('vendor/autoload.php', filedir . ';', 1)
    if len(wdir)
        let wdir = fnamemodify(wdir, ':p:h:h')
    endif
    if wdir == ""
        call cm#message('WARN', "[ncm-phpactor] Upwards vendor/autoload.php detection failed for " . expand('%'))
        return fnamemodify(getcwd(), ':p')
    else
        return wdir
    endif
endfunc

