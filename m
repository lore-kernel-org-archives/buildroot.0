From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Fri, 20 Jun 2008 15:15:55 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <20080620125720.GE12682@mx.loc>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc>
Message-ID: <485BAD8B.4030008@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Fri, Jun 20, 2008 at 10:40:22AM +0200, Hinko Kocevar wrote:
> 
>> With gcc 4.3.1 gcc internal errors went away, so I'm really glad I found the GIT tree!
> 
> I have improved (i hope) the cris support, configuration-wise, please
> pull and let me know if it suits your needs.
> 

Nice. I'm trying it out right now..

BTW:
Have you successfully compiled linux 2.6.25.x kerne?l with cris toolchain? Mine fails with:
 CC [M]  drivers/video/fbcmap.o
  CC [M]  drivers/video/fbsysfs.o
  CC [M]  drivers/video/modedb.o
  CC [M]  drivers/video/fbcvt.o
  LD [M]  drivers/video/fb.o
  CC [M]  drivers/video/cfbfillrect.o
  CC [M]  drivers/video/cfbcopyarea.o
  CC [M]  drivers/video/cfbimgblt.o
  LD      drivers/built-in.o
  LD      sound/built-in.o
  LD      arch/cris/arch-v10/drivers/built-in.o
  CC      net/socket.o
  LD      net/802/built-in.o
  CC      net/core/sock.o
  CC      net/core/request_sock.o
  CC      net/core/skbuff.o
  CC      net/core/iovec.o
  CC      net/core/datagram.o
  CC      net/core/stream.o
(const_int -13 [0xfffffff3])
net/core/stream.c: In function 'sk_stream_wait_connect':
net/core/stream.c:78: internal compiler error: output_operand: invalid operand for 'p' modifier
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
{standard input}: Assembler messages:
{standard input}:488: Warning: partial line at end of file ignored
make[2]: *** [net/core/stream.o] Error 1
make[1]: *** [net/core] Error 2
make: *** [net] Error 2


-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
