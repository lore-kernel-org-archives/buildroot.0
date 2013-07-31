From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:06:22 +0200
Subject: [Buildroot] [PATCH 1/3] package/uclibc: number patches for
 0.9.32.1
In-Reply-To: <1375275819-29308-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375275819-29308-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130731180622.44197b0a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 31 Jul 2013 10:03:37 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...atch => uclibc-0001-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch} | 0
>  ...ch => uclibc-0002-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch} | 0
>  ...> uclibc-0003-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch} | 0
>  .../{uclibc-sparc-errno-fix.patch => uclibc-0004-sparc-errno-fix.patch}   | 0
>  .../uclibc/0.9.32.1/{uclibc-unshare.patch => uclibc-0005-unshare.patch}   | 0
>  ...uxthreads-errno-fix.patch => uclibc-0006-linuxthreads-errno-fix.patch} | 0
>  6 files changed, 0 insertions(+), 0 deletions(-)

Commit all three patches. Two things to notice:

 * Patchwork didn't detect PATCH 1/3, probably because it only
   consisted of git rename, and the patch itself was empty.

 * We normally don't accept feature patches in Buildroot. However,
   uClibc is really a core component, and their release cycle is slow
   (too say the least), so when a feature is upstream, it sometimes
   makes sense to backport it. But this should be the exception rather
   than the rule.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
