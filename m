From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Oct 2017 21:22:50 +0000
Subject: [Buildroot] [Bug 10336] lttng compilation fails : linking error
In-Reply-To: <bug-10336-163@https.bugs.busybox.net/>
References: <bug-10336-163@https.bugs.busybox.net/>
Message-ID: <bug-10336-163-kXtsLmVt3q@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10336

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I can't reproduce with the following defconfig:

BR2_x86_64=y
BR2_HOST_DIR="/home/test/custom-host-dir/"
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_GCC_VERSION_5_X=y
BR2_PACKAGE_LTTNG_LIBUST=y

Are you sure your build failure is reproducible after doing a "make clean all"
? If it is, then please reopen this bug, attaching a minimal defconfig that
allows to reproduce the build failure.

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
