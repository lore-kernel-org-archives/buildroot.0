From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Jun 2008 20:32:07 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc: 4.3.1
In-Reply-To: <6a2e33620806200906h5b27d157s551782a16eb00a36@mail.gmail.com>
	(Fathi Boudra's message of "Fri\, 20 Jun 2008 18\:06\:17 +0200")
References: <20080619190606.260DD3C67C@busybox.net>
	<6a2e33620806200850p4835102as74efd47c020f36e4@mail.gmail.com>
	<20080620155605.GA15710@mx.loc>
	<6a2e33620806200906h5b27d157s551782a16eb00a36@mail.gmail.com>
Message-ID: <87r6as2c0o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fathi" == Fathi Boudra <fboudra@gmail.com> writes:

 Fathi> /usr/powerpc-linux-gnu/bin/ld: cannot find -lc
 Fathi> collect2: ld returned 1 exit status

 Fathi> btw, it's against libc and not uclibc. I tried against uclibc
 Fathi> but I have another build failure.

I also seem to have problems on powerpc, but haven't looked at it yet
in detail:

/home/peko/source/buildroot/toolchain_build_powerpc/gcc-4.3.1/libgcc/../libdecnumber/decExcept.c:30:18: error: fenv.h: No such file or directory
make[2]: *** [decExcept.o] Error 1
make[2]: Leaving directory `/home/peko/source/buildroot/toolchain_build_powerpc/gcc-4.3.1-initial/powerpc-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory
`/home/peko/source/buildroot/toolchain_build_powerpc/gcc-4.3.1-initial'

-- 
Bye, Peter Korsgaard
