From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 10:38:18 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <1232286463.1493.10.camel@bender> (Sven Neumann's message of
	"Sun\, 18 Jan 2009 14\:47\:43 +0100")
References: <20090116141347.DD52277567@busybox.osuosl.org>
	<1232123796.6639.16.camel@sven> <87r6333vms.fsf@macbook.be.48ers.dk>
	<1232286463.1493.10.camel@bender>
Message-ID: <871vuyxqph.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

 >> So what you are saying is that libmap builds with some other gcc
 >> version (4.2.4?), and not with 4.3.2? What arch are you on?

 Sven> Yes, libmad cross-compiles for ARM with gcc 4.2.4 but that
 Sven> build breaks when I change gcc to 4.3.2. That was the only
 Sven> thing I changed in this build.

Fixed in r24919.

-- 
Bye, Peter Korsgaard
