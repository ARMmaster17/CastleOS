//
// Created by wordm on 4/21/2021.
//

#ifndef CASTLEOS_COMMON_H
#define CASTLEOS_COMMON_H

typedef unsigned int   u32int;
typedef          int   s32int;
typedef unsigned short u16int;
typedef          short s16int;
typedef unsigned char  u8int;
typedef          char  s8int;

void outb(u16int port, u8int value);
u8int inb(u16int port);
u16int inw(u16int port);

#endif //CASTLEOS_COMMON_H
