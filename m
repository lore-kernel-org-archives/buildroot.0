From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 29 Apr 2009 13:22:56 +0200
Subject: [Buildroot] [PATCH] uClibc: fix 0.9.30.1 build
	with	linuxthreads on ARM
In-Reply-To: <87y6tjdcgj.fsf@macbook.be.48ers.dk>
References: <1240997522-10973-1-git-send-email-mroth@nessie.de>
	<87y6tjdcgj.fsf@macbook.be.48ers.dk>
Message-ID: <20090429112256.GA18534@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 29, 2009 at 11:41:00AM +0200, Peter Korsgaard wrote:
>>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:
>
> Michael> Patch by Will Wagner <will_wagner@carallon.com> - From uclibc svn r25099.
>
>Is this identical to the existing
>toolchain/uClibc/uClibc-0.9.30-arm-fix-linuxthreads-sysdep.patch ?

And, furthermore, does it work?
Please post the complete results of the thread-tests from 'make test'.
thanks,
