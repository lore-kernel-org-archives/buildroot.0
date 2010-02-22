From: Miguel Angel Brintrup <mbrintrup@tecnocal.cl>
Date: Mon, 22 Feb 2010 17:13:06 -0300
Subject: [Buildroot] problem with execution ./mai -sh: ./main not found
Message-ID: <3ce6ccff1002221213o212936c2ub3937bedbb55f7e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all I have a big but dummy problem. I have a main file compiled with
gcc (usr/local/arm/3.4.1/bin/arm-linux-gcc) but when I try to run the
program appears this problem:

# ./main
-sh: ./main: not found

The main file is already exist:

# ls
DocumentacionDoxygen       headers
Doxyfile                   libmcuinterface.a
Makefile                   main
buffer.c                   main.c
buffer.o                   mcu_interface.c
communication_interface.c  mcu_interface.o
communication_interface.o  rs232.c
crc16.c                    rs232.o
crc16.o

And PATH is:

# echo $PATH
/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/bin

I try with different kernels and file systems based in buildroot, but the
problem stay here.
I'm using a at91sam9261ek board and SAM-BA software to load the kernel
images and file systems.
I have a second board and I charge a kernel with file system with uboot and
this work without problems.

Anyone have any ideas?

Thanks in Advanced

-- 
Miguel Angel Brintrup B.
skype: miguel.brintrup

Atenci?n: Piense bien antes de imprimir este correo electr?nico, el medio
ambiente debe ser preocupaci?n de todos.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100222/44cc3aaf/attachment.htm>
