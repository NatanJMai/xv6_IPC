/*
 * Message Queue
 *
 * */
typedef struct message{
  unsigned int id;
  int pidS;               // Source
  int pidT;               // Target
  char *data;             // Content
  struct message *next;   // Next message.
  struct message *prev;	  // Previous message.
} message;
  

typedef struct queue{
  int id;
  int nr_msg;             // Elements
  message *first_msg;     // The first one
  message *last_msg;      // The last one
} queue;


