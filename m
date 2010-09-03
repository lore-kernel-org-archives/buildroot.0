From: konrad at gaisler.com <konrad@gaisler.com>
Date: Fri, 03 Sep 2010 11:30:23 -0400
Subject: [Buildroot] Gaisler sparc-leon
Message-ID: <20100903113023.l9mk74coyx4480ow@webmail.bluegenesis.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Fri, 03 Sep 2010 16:50:06  0200, Peter Korsgaard  wrote:
>>>>> "konrad" == konrad  <konrad@gaisler.com> writes:
  >
  > Hi,
  >
  >  konrad> My shortterm goal is to get buildroot to build a linux image
  >  konrad> with romfs that includes libc shared and some more advanced app
  >  konrad> like a ssh. That should cover/test already a lot
  >  konrad> functionality. So far in snapgear 2.0 we only used uClibc
  >  konrad> static, we had made quite a few patches to uclibc, didnt submit
  >  konrad> them to the uclibc though. It was also a fairly old uclibc that
  >  konrad> we used, it seems that uclibc has gotten better in the meantime
  >  konrad> (while we sticked still to the old version...). I think that if
  >  konrad> Gaisler would switch to buildroot and Leon users would start
  >  konrad> using it the sparc the sparc part would be maintained and
  >  konrad> running.I'll press this now and will post my results
  >
  > Ok, good - Shared linking on sparc indeed used to be broken as far as I
  > remember. 
  >
  >  konrad> Ps: Note at the side: If no hardware is available the
  >  konrad> evaluation version of the sparcleon simulator called TSIM can
  >  konrad> be used, so that non sparc users can run/test/verify too. ?
  >
  > What about something a bit more standard like qemu-system-sparc? We're
  > already using qemu to test E.G. arm. 
?
I didnt try qemu-system-sparc yet, only ran qemu-user-sparc once but saw that
fork() didnt work there ( simple programms however started right away which
was impressive enough). qemu-system-sparc wouldn't be a Leon system
but there might be advantages though related to testing. Internally
however we'll well have to stick to TSIM and Leon hardware. But still, if it
would enable to integrate Sparc into a general testscript framework that you
maybe have and run to test buildroot, then it might be? worthwile. 
But I guess I first get something simple running... 
-- Greetings Konrad
?
?
>
  > --
  > Bye, Peter Korsgaard
  >
  >

?
