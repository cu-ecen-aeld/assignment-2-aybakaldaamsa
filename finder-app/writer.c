#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Setting up syslog logging
    openlog(NULL, LOG_PID, LOG_USER);

    // Checking if the number of arguments is correct
    if (argc != 3) {
        syslog(LOG_ERR, "Error: Invalid number of arguments");
        syslog(LOG_ERR, "Usage: %s <full_path_to_file> <text_to_write>", argv[0]);
        // printf("ERROR:test..............");
    
        closelog();
        return 1;
    }

    // Extracting arguments
    char *writefile = argv[1];
    char *writestr = argv[2];

    // Attempting to open the file for writing
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Could not open or create the file.");
        closelog();
        return 1;
    }

    // Writing the text string to the file
    if (fputs(writestr, file) == EOF) {
        syslog(LOG_ERR, "Error: Could not write to the file.");
        fclose(file);
        closelog();
        return 1;
    }

    // Closing the file
    fclose(file);

    // Logging the successful writing of the text to the file
    syslog(LOG_DEBUG, "Writing \"%s\" to \"%s\"", writestr, writefile);

    closelog();
   // printf("test..............");
    
    return 0;
}
