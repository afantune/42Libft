# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afantune <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/25 12:36:13 by afantune          #+#    #+#              #
#    Updated: 2024/11/06 11:08:42 by afantune         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS	= ft_isalnum.c ft_isprint.c ft_memcmp.c \
					ft_strlcat.c ft_strncmp.c ft_substr.c \
					ft_atoi.c ft_isalpha.c ft_split.c \
					ft_itoa.c ft_memcpy.c ft_putendl_fd.c \
					ft_strlcpy.c ft_putchar_fd.c ft_strmapi.c\
					ft_strnstr.c ft_tolower.c ft_bzero.c \
					ft_isascii.c ft_memcpy.c ft_strjoin.c \
					ft_memmove.c ft_putnbr_fd.c ft_strdup.c \
					ft_strlen.c ft_strrchr.c ft_strchr.c \
					ft_toupper.c ft_calloc.c ft_strtrim.c \
					ft_isdigit.c ft_memchr.c ft_memset.c \
					ft_putstr_fd.c ft_striteri.c
SRCS_B	= ft_lstnew.c ft_lstadd_back.c ft_lstadd_front.c \
	  ft_lstsize.c ft_lstlast.c ft_lstclear.c \
	  ft_lstdelone.c ft_lstiter.c ft_lstmap.c

OBJS	= ${SRCS:.c=.o}
OBJS_B 	= ${SRCS_B:.c=.o}
INCS	= libft.h
NAME	= libft.a
LIBC	= @ar rcs
LIBR	= @ranlib
CC		= @cc
RM		= @rm -f
CFLAGS	= -Wall -Wextra -Werror -I ${INCS}

%.o : %.c
	${CC} ${CFLAGS} -c $< -o $@

${NAME}: ${OBJS}
	${LIBC} ${NAME} ${OBJS}
	${LIBR} ${NAME}
	@echo "Files Compiled"

all: ${NAME}

bonus: ${OBJS_B}
	@${MAKE} -s ${NAME}
	${LIBC} ${NAME} ${OBJS} ${OBJS_B}
	@echo "Bonus Files Compiled"
	@touch bonus

clean: 
	${RM} ${OBJS} ${OBJS_B} bonus
	@echo "Objects Cleaned"

fclean: clean
	${RM} ${NAME}
	@echo "Libft.a Has Been Cleaned"

re: fclean all

.PHONY: all clean re fclean
