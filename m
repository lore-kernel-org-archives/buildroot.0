From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Thu, 23 Oct 2008 11:54:59 +0200
Subject: [Buildroot] Busybox build fails with external toolchain
In-Reply-To: <87y70fd4ig.fsf@macbook.be.48ers.dk>
References: <c88e466f0810230239m298d6b09v92a11fdb4ce5f077@mail.gmail.com>
	<87y70fd4ig.fsf@macbook.be.48ers.dk>
Message-ID: <e4c675870810230254x76c1b273i8eddc8002e629fe7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/23 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Michel" == Michel Benoit <michel.benoit@sepab.se> writes:
>
>  Michel> Hi,
>  Michel> I'm trying to use buildroot to build a rootfs with an external
>  Michel> toolchain based on uclibc.
>  Michel> I'm using buildroot svn revision 23768
>  Michel> The toolchain is based on gcc 4.1.2.
>
> The external toolchain stuff is known to be kinda flaky - But maybe
> your problem is the ~ - Could you try with an absolute path to the
> external toolchain?

Then if you still experiment problems you should try applying the
patch attached to this bug report

http://busybox.net/bugs/view.php?id=5474


 Cheers,
-- 
/roberto
