From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Sat, 18 Oct 2008 15:44:01 +0200
Subject: [Buildroot] Atmel file system skeleton missing /sys directory
In-Reply-To: <877i86m5hb.fsf@macbook.be.48ers.dk>
References: <COL0-DAV4103F240DBC50EEFAE20318D2D0@phx.gbl>
	<e4c675870810180052g314a2641oe501318f3a343f62@mail.gmail.com>
	<877i86m5hb.fsf@macbook.be.48ers.dk>
Message-ID: <e4c675870810180644x2ebc3e43g22f64c55c2e3667c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/18 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Roberto" == Roberto A Foglietta <roberto.foglietta@gmail.com> writes:
>
> Hi,
>
>  Roberto>  Playing with the i386 target I see /proc /sys and sometime
>  Roberto> /usr/lib are missing. The last one in particular when no any
>  Roberto> package 'mkdir' it the main 'make' fails in running a 'find'
>  Roberto> in that not existent directory.
>
> Can you be more specific? target/generic/target_skeleton has both
> /sys, /proc and /usr/lib.

roberto at rafbook:~/gles/buildroot$ svn info | grep Last
Last Changed Author: jacmet
Last Changed Rev: 23701
Last Changed Date: 2008-10-17 12:19:41 +0200 (Fri, 17 Oct 2008)
roberto at rafbook:~/gles/buildroot$ ls -al project_build_i586/ugles/root/

 I started without any package but only toolchain and after added
busybox. I tried the actual .config and works properly, please forget
my msg. In case I found a way to reproduce it I will open a report in
the bug tool.

 Thanks,
-- 
/roberto
