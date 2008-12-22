From: hartleys <hartleys@visionengravers.com>
Date: Mon, 22 Dec 2008 11:30:41 -0500
Subject: [Buildroot] Unable to 'make' with svn revision 24492
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909F3E892@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I just did an svn up to the latest revision and can no longer do a
'make'. When I try the build I get the following error:

make: *** No rule to make target `cross_compiler', needed by
`/home/bigguiness/arm-uclibc-gcc-.sh'.  Stop.

I am using an external binary toolchain and everything has worked fine
up until the latest revision.

Any idea? Thanks,
Hartley
