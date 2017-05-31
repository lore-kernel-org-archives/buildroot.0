From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 May 2017 12:29:54 +0200
Subject: [Buildroot] Cherry-pick
	2530fe810ee7ece8da30e246af522e2e0be8e83f in 2017.02.x
In-Reply-To: <20170531105851.0e4d6b37@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 31 May 2017 10:58:51 +0200")
References: <20170531105851.0e4d6b37@free-electrons.com>
Message-ID: <87r2z5mi8t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello Peter,
 > I think you could cherry-pick commit
 > 2530fe810ee7ece8da30e246af522e2e0be8e83f into the 2017.02.x branch. It
 > fixes a build failure of gdb with uclibc/musl caused by
 > rpl_gettimeofday().

 > I.e, on 2017.02.2, the following defconfig fails to build gdb:

 > BR2_aarch64=y
 > BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 > BR2_PTHREAD_DEBUG=y
 > BR2_PACKAGE_GDB=y

 > With this commit cherry-picked, it builds fine.

Ok, makes sense - Committed to 2017.02.x, thanks.

Once 2017.05 is out I will also go through the various fixes added
during the RC phase and cherry pick what applies and put out 2017.02.3.

-- 
Bye, Peter Korsgaard
