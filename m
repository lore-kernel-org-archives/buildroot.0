From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 16 Jan 2012 21:35:00 +0100
Subject: [Buildroot] GDB 7.3.1 boken for ARM ? (2011.11)
Message-ID: <69B86DB5B70A4977A204FB5312DD0C7E@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

 

Hi

 

 

While trying to cross debug with GDB 7.3.1 and gdbserver on the target  i get this on  the eclipse console :

So the 7.3.1 seems to be broken for ARM.

 

I'm sorry, Dave, I can't do that.  Symbol format `elf32-littlearm' unknown.

Reading symbols from /home/johan/other/projects_other/SMSController-1.0.0/Debug/SMSController...214-gdb-set confirm off

214^done

(gdb) 

215-gdb-set width 0

215^done

(gdb) 

216-gdb-set height 0

216^done

(gdb) 

217-interpreter-exec console echo

217^done

218-gdb-show prompt

(gdb) 

218^done,value="(gdb) "

(gdb) 

219-gdb-set auto-solib-add off

219^done

(gdb) 

220-gdb-set stop-on-solib-events 0

220^done

(gdb) 

221-target-select remote 192.168.1.122:10000

 

I tried the 7.1 and 7.2.1 and these seem to be OK 

(rest of toolchain is binutils 2.22 & gcc 4.5.x ).

 

Sagaert Johan

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120116/12442b6a/attachment-0001.html>
