From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 30 Apr 2015 16:03:13 +0200
Subject: [Buildroot] [PATCH v2 0/2] mono: bump to version 4.0.1
Message-ID: <1430402595-5355-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series bumps mono version to 4.0.1.
It also removes no more needed patches accepted upstream.

Angelo Compagnucci (2):
  package/monolite: bump to version 117
  package/mono: bump to version 4.0.1

 .../0003-mono-context.h-fix-build-on-MIPS.patch    | 33 --------
 ...e-ppc-sigctx-monoctx-conversion-code-to-m.patch | 92 ----------------------
 ...build-errors-in-mono-context.c-on-ppc64el.patch | 84 --------------------
 package/mono/Config.in                             | 22 ------
 package/mono/mono.mk                               |  9 +--
 package/monolite/monolite.mk                       |  2 +-
 6 files changed, 2 insertions(+), 240 deletions(-)
 delete mode 100644 package/mono/0003-mono-context.h-fix-build-on-MIPS.patch
 delete mode 100644 package/mono/0004-jit-Move-the-ppc-sigctx-monoctx-conversion-code-to-m.patch
 delete mode 100644 package/mono/0005-Fix-build-errors-in-mono-context.c-on-ppc64el.patch

-- 
1.9.1
