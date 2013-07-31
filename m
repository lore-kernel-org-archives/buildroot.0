From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:01:41 +0200
Subject: [Buildroot] [git commit] package/uclibc: number patches for 0.9.32.1
Message-ID: <20130731160445.B75429AF57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6213bab936c8b8911f0e826aca70e5c491659345
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-e500-__fe_nomask_env-use-of-__set_errno.patch} |    0
 ..._libc_epoll_pwait-compile-failure-on-x86.patch} |    0
 ...eps-add-__kernel_long-and-__kernel_ulong.patch} |    0
 ...fix.patch => uclibc-0004-sparc-errno-fix.patch} |    0
 ...ibc-unshare.patch => uclibc-0005-unshare.patch} |    0
 ...ch => uclibc-0006-linuxthreads-errno-fix.patch} |    0
 6 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.32.1/uclibc-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch b/package/uclibc/0.9.32.1/uclibc-0001-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
similarity index 100%
rename from package/uclibc/0.9.32.1/uclibc-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
rename to package/uclibc/0.9.32.1/uclibc-0001-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
diff --git a/package/uclibc/0.9.32.1/uclibc-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch b/package/uclibc/0.9.32.1/uclibc-0002-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
similarity index 100%
rename from package/uclibc/0.9.32.1/uclibc-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
rename to package/uclibc/0.9.32.1/uclibc-0002-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
diff --git a/package/uclibc/0.9.32.1/uclibc-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch b/package/uclibc/0.9.32.1/uclibc-0003-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
similarity index 100%
rename from package/uclibc/0.9.32.1/uclibc-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
rename to package/uclibc/0.9.32.1/uclibc-0003-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
diff --git a/package/uclibc/0.9.32.1/uclibc-sparc-errno-fix.patch b/package/uclibc/0.9.32.1/uclibc-0004-sparc-errno-fix.patch
similarity index 100%
rename from package/uclibc/0.9.32.1/uclibc-sparc-errno-fix.patch
rename to package/uclibc/0.9.32.1/uclibc-0004-sparc-errno-fix.patch
diff --git a/package/uclibc/0.9.32.1/uclibc-unshare.patch b/package/uclibc/0.9.32.1/uclibc-0005-unshare.patch
similarity index 100%
rename from package/uclibc/0.9.32.1/uclibc-unshare.patch
rename to package/uclibc/0.9.32.1/uclibc-0005-unshare.patch
diff --git a/package/uclibc/0.9.32.1/uclibc-linuxthreads-errno-fix.patch b/package/uclibc/0.9.32.1/uclibc-0006-linuxthreads-errno-fix.patch
similarity index 100%
rename from package/uclibc/0.9.32.1/uclibc-linuxthreads-errno-fix.patch
rename to package/uclibc/0.9.32.1/uclibc-0006-linuxthreads-errno-fix.patch
