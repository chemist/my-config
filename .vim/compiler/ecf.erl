-module(ecf).
-compile(export_all).


check(File) ->
	compile:file(File, [warn_obsolete_guard,
			                warn_unused_import, 
											warn_shadow_vars,
											warn_export_vars, 
											strong_validation, report]).


server_check() ->
	receive
		File -> 
			check(File)
	end,
	server_check().

start_server() ->
	Pid = spawn(fun server_check/0),
	register(corrector,Pid).

