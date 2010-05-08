From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 May 2010 20:36:40 +0200
Subject: [Buildroot] Mplayer
In-Reply-To: <AANLkTikHUmI1rc-PHN-_DswuxT3RfnvP2G5p9FU5nS6r@mail.gmail.com>
	(Bart Otten's message of "Sat, 8 May 2010 16:09:47 +0200")
References: <w2w76d09b281004291240oe35449fdz226a42e12a5097a0@mail.gmail.com>
	<4BD9E3BF.8080106@gmail.com> <8739y4agy8.fsf@macbook.be.48ers.dk>
	<AANLkTimwzzNwDOF4mOhtPDzOCvtSe9-MVpmrZHvBFveR@mail.gmail.com>
	<87aasa7g4r.fsf@macbook.be.48ers.dk>
	<AANLkTikHUmI1rc-PHN-_DswuxT3RfnvP2G5p9FU5nS6r@mail.gmail.com>
Message-ID: <87wrve5jgn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bart" == Bart Otten <bartotten@gmail.com> writes:

 Bart> 2010/5/8 Peter Korsgaard <jacmet@uclibc.org>

 Bart> ass_render.c:(.text+0x3862): undefined reference to `__assert_fail'
 Bart> libass/libass.a(ass_bitmap.o):ass_bitmap.c:(.text+0x24d): more undefined
 Bart> references to `__assert_fail' follow
 Bart> collect2: ld returned 1 exit status
 Bart> make[1]: *** [mplayer] Error 1
 Bart> make[1]: Leaving directory `/home/Bart/buildroot-2010.05-rc1/output/build/

__assert_fail is from glibc, so it must be trying to link to something
from your host.

-- 
Bye, Peter Korsgaard
