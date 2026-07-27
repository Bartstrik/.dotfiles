//Simple program I wrote to add more bash shortcut scripts.

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char** argv) {
	if (argc != 2) {
		printf("Usage: add_script \"command_name\"\n");
		return 1;
	}

	FILE *template = fopen("template.sh", "r");
	if (template == NULL) {
		printf("template.sh doesn't exist or isn't able to be opened\n");
		return 1;
	}

	char* command_name = argv[1];
	char* command_filename = malloc(strlen(command_name) + 4);
	strcpy(command_filename, command_name);
	strcat(command_filename, ".sh");
	
	//I have to use linux's operating syscall open(), because C doesn't provide the option to create a file with execution permissions.
	int fd = creat(command_filename, 0744);
	if(fd == -1){
        printf("Error opening file !!");
        return 1;
    }
	close(fd);

	FILE *output = fopen(command_filename, "w");	
	free(command_filename);

	//replace string "~" with string passed in by the user
	char buffer[100] = {'\0'};
	
	// -command_name to ensure we have enough space in the buffer to add the commandname
	int buff_use_size = sizeof(buffer) - strlen(command_name) + 1;
	while(fgets(buffer, buff_use_size, template)) {
		for(size_t i = 0; i < buff_use_size; i++) {
			if(buffer[i] == '~') {
				//shift all remaining elements to the right by strlen(command_name)-1
				for(size_t j = sizeof(buffer); j > i + strlen(command_name) - 1; j--) {
					buffer[j] = buffer[j - strlen(command_name) + 1];
				}
				//insert command_name at index i
				for(size_t j = 0; j < strlen(command_name); j++) {
					buffer[i] = command_name[j];
					i++;
				}
			}
		}
		fwrite(buffer, 1, strlen(buffer), output);
		//resetting buffer to be all zeros.
		for(size_t i = 0; i < sizeof(buffer); i++) { buffer[i] = '\0'; }
	}

	fclose(output);
	fclose(template);
	return 0;
}
