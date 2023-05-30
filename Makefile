server_run:
	cd listie2_server && dart bin/main.dart

server_generate:
	cd listie2_server && serverpod generate --watch

flutter_gen:
	cd listie2_flutter && flutter packages pub run build_runner build --delete-conflicting-outputs
