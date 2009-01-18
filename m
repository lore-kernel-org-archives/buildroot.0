From: Sven Neumann <s.neumann@phase-zero.de>
Date: Sun, 18 Jan 2009 14:47:43 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <87r6333vms.fsf@macbook.be.48ers.dk>
References: <20090116141347.DD52277567@busybox.osuosl.org>
	<1232123796.6639.16.camel@sven>  <87r6333vms.fsf@macbook.be.48ers.dk>
Message-ID: <1232286463.1493.10.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2009-01-16 at 20:20 +0100, Peter Korsgaard wrote:

> So what you are saying is that libmap builds with some other gcc
> version (4.2.4?), and not with 4.3.2? What arch are you on?

Yes, libmad cross-compiles for ARM  with gcc 4.2.4 but that build breaks
when I change gcc to 4.3.2. That was the only thing I changed in this
build.


Sven
