/*
 * Message Queue
 *
 * */
typedef struct message{
  unsigned int id;
  int pidS;         // Source
  int pidT;         // Target
  char *data;
} message;
  

typedef struct queue{
  int id;
  message message[10];
} queue;


