From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Mar 2008 08:29:45 +0100
Subject: [Buildroot] Compilation Error
In-Reply-To: <1d09f8b80803201838p2fa47bdcgcece859532c48be5@mail.gmail.com>
	(Will Buik's message of "Thu\, 20 Mar 2008 21\:38\:04 -0400")
References: <1d09f8b80803201838p2fa47bdcgcece859532c48be5@mail.gmail.com>
Message-ID: <87wsnw357a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Buik <willbuik@gmail.com> writes:

Hi,

 Will> I am getting this error with a default configuration of buildroot:
 Will> `/XXX/buildroot/dl/busybox-snapshot.tar.bz2' saved [2989276/2989276]

 Will> bzcat /XXX/buildroot/dl/busybox-snapshot.tar.bz2 | tar -C /XXX/buildroot/
 Will> project_build_i686/uclibc   -xf -
 Will> # Allow busybox patches.
 Will> toolchain/patch-kernel.sh /XXX/buildroot/project_build_i686/uclibc/busybox
 Will> package/busybox busybox.\*.patch
 Will> touch /XXX/buildroot/project_build_i686/uclibc/busybox/.unpacked
 Will> make: *** No rule to make target `package/busybox/busybox-1.9.0.config', needed
 
Did you change BR2_PACKAGE_BUSYBOX_CONFIG? Please set it to
busybox-1.6.0.config instead.

-- 
Bye, Peter Korsgaard
