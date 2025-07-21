#ifndef PMAIL_H_
#define PMAIL_H_

// Sends a message to another processes mailbox
void send_message(int receiver_pid, int size, const char *data);

// Reads a message from own mailbox.
// Returns 1 if a message is present, otherwise 0
int read_message(char message[258]);

#endif // PMAIL_H_