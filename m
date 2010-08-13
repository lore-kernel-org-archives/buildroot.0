From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Aug 2010 15:14:17 +0000 (UTC)
Subject: [Buildroot] [Bug 2401] sysvinit-2.86 fails to build on MIPS because
 is missing -lcrypt
In-Reply-To: <bug-2401-163@https.bugs.busybox.net/>
References: <bug-2401-163@https.bugs.busybox.net/>
Message-ID: <20100813151417.C536887458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2401

--- Comment #5 from S?rgio <sergio@sergiomb.no-ip.org>  ---
(In reply to comment #3)
> Here, even my limited
> x86_64 Debian chroot has /usr/lib/libcrypt.a, so I didn't see the potential
> problem.

yum provides */libcrypt.a
(...)
Repo        : fedora
Filename    : /usr/lib/dietlibc/lib-x86_64/libcrypt.a

uClibc-devel-0.9.30.1-2.fc12.x86_64 : Header files and libraries for uClibc
library
Repo        : fedora
Filename    : /usr/lib64/uClibc/libcrypt.a

uClibc-devel-0.9.30.1-2.fc12.i686 : Header files and libraries for uClibc
library
Repo        : fedora
Filename    : /usr/lib/uClibc/libcrypt.a

dietlibc-devel-0.32-0.fc12.i686 : dietlibc development files
Repo        : fedora
Filename    : /usr/lib/dietlibc/lib-i386/libcrypt.a

arm-gp2x-linux-glibc-2.3.6-7.fc12.noarch : Cross Compiled GNU C Library
targeted at arm-gp2x-linux
Repo        : fedora
Filename    : /usr/arm-gp2x-linux/lib/libcrypt.a

glibc-static-2.12-3.x86_64 : C library static libraries for -static linking.
Repo        : updates
Filename    : /usr/lib64/libcrypt.a

glibc-static-2.12-3.i686 : C library static libraries for -static linking.
Repo        : updates
Filename    : /usr/lib/libcrypt.a



I have installed /usr/lib64/libcrypt.a, 

Should I install also glibc-static-2.12-3.i686  ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
