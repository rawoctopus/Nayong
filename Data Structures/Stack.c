//
//  Stack.c
//  
//
//  Created by 김나용 on 26/06/2019.
//

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_SIZE 1000

typedef int data;

typedef struct stack {
    data arr[MAX_SIZE];
    int top;
} stack;

void init(stack *pstack) {
    pstack->top = -1;
}

void push(stack *pstack, int data) {
    pstack->top += 1;
    pstack->arr[pstack->top] = data;
}

int is_empty(stack *pstack) {
    return pstack->top <= -1;
}

void pop(stack *pstack) {
    if (is_empty(pstack)) {
        printf("ERROR: pop is not available. stack is empty.\n");
    }
    pstack->top -= 1;
}

int peek(stack *pstack) {
    if (is_empty(pstack)) {
        printf("ERROR: peek is not available. stack is empty.\n");
        exit(-1);
    }
    return pstack->arr[pstack->top];
}

void stack_print(char *messege, stack *pstack) {
    int i = 0;
    printf("%s : ", messege);
    while(i <= pstack->top) {
        printf("%d ", pstack->arr[i++]);
    }
    printf("\n");
}

int main() {
    stack mstack;
    init(&mstack);
    stack_print("init", &mstack);
    
    push(&mstack, 1);
    push(&mstack, 2);
    push(&mstack, 3);
    push(&mstack, 4);
    push(&mstack, 5);
    stack_print("push 5 items", &mstack);
    
    int peeked_item = peek(&mstack);
    printf("peek 1 items: %d\n", peeked_item);
    
    pop(&mstack);
    pop(&mstack);
    stack_print("pop 2 items", &mstack);
}

