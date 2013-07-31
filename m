From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Jul 2013 10:03:37 -0300
Subject: [Buildroot] [PATCH 1/3] package/uclibc: number patches for 0.9.32.1
Message-ID: <1375275819-29308-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...atch => uclibc-0001-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch} | 0
 ...ch => uclibc-0002-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch} | 0
 ...> uclibc-0003-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch} | 0
 .../{uclibc-sparc-errno-fix.patch => uclibc-0004-sparc-errno-fix.patch}   | 0
 .../uclibc/0.9.32.1/{uclibc-unshare.patch => uclibc-0005-unshare.patch}   | 0
 ...uxthreads-errno-fix.patch => uclibc-0006-linuxthreads-errno-fix.patch} | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename package/uclibc/0.9.32.1/{uclibc-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch => uclibc-0001-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch} (100%)
 rename package/uclibc/0.9.32.1/{uclibc-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch => uclibc-0002-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch} (100%)
 rename package/uclibc/0.9.32.1/{uclibc-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch => uclibc-0003-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch} (100%)
 rename package/uclibc/0.9.32.1/{uclibc-sparc-errno-fix.patch => uclibc-0004-sparc-errno-fix.patch} (100%)
 rename package/uclibc/0.9.32.1/{uclibc-unshare.patch => uclibc-0005-unshare.patch} (100%)
 rename package/uclibc/0.9.32.1/{uclibc-linuxthreads-errno-fix.patch => uclibc-0006-linuxthreads-errno-fix.patch} (100%)

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
-- 
1.8.1.5
