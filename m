From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 20:20:59 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <1232123796.6639.16.camel@sven> (Sven Neumann's message of "Fri\,
	16 Jan 2009 17\:36\:36 +0100")
References: <20090116141347.DD52277567@busybox.osuosl.org>
	<1232123796.6639.16.camel@sven>
Message-ID: <87r6333vms.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

Hi,

 >> toolchain/gcc: default to 4.3.2 for !AVR32

 Sven> I've tried to follow this change in our tree, but ran into the
 Sven> following error when building libmad:

 Sven>  cc1: error: unrecognized command line option "-fforce-mem"

So what you are saying is that libmap builds with some other gcc
version (4.2.4?), and not with 4.3.2? What arch are you on?

 Sven> I guess this can somehow be fixed in the libmad package. Just
 Sven> wanted to let you know.

Thanks.

-- 
Bye, Peter Korsgaard
