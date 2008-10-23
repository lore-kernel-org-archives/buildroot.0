From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Oct 2008 11:50:31 +0200
Subject: [Buildroot] Busybox build fails with external toolchain
In-Reply-To: <c88e466f0810230239m298d6b09v92a11fdb4ce5f077@mail.gmail.com>
	(Michel Benoit's message of "Thu\, 23 Oct 2008 11\:39\:22 +0200")
References: <c88e466f0810230239m298d6b09v92a11fdb4ce5f077@mail.gmail.com>
Message-ID: <87y70fd4ig.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michel" == Michel Benoit <michel.benoit@sepab.se> writes:

 Michel> Hi,
 Michel> I'm trying to use buildroot to build a rootfs with an external
 Michel> toolchain based on uclibc.
 Michel> I'm using buildroot svn revision 23768
 Michel> The toolchain is based on gcc 4.1.2.

The external toolchain stuff is known to be kinda flaky - But maybe
your problem is the ~ - Could you try with an absolute path to the
external toolchain?

-- 
Bye, Peter Korsgaard
