##
## Makefile for asm in /home/le_l/Workspace/asm_minilibc/asm_dl
##
## Made by Victor Le
## Login   <le_l@epitech.net>
##
## Started on  Sat Mar 12 14:43:42 2016 Victor Le
## Last update Sat Mar 26 17:06:50 2016 Victor Le
##

RM		= rm -rf

NAME		= libasm.so

CC		= gcc
NASM		= nasm -f elf64

SRCS		= strdup.S	\
		memcpy.S	\
		memmove.S	\
		strcasecmp.S	\
		rindex.S	\
		strpbrk.S	\
		strcspn.S	\
		memset.S	\
		strstr.S	\
		strchr.S	\
		strlen.S	\
		strncmp.S	\
		strcmp.S

OBJS		= $(SRCS:.S=.o)


all: $(NAME)

%.o: %.S
	$(NASM) $<

$(NAME): $(OBJS)
	$(CC) -shared -o $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: re fclean clean all
