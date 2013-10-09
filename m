From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:19:42 +0200
Subject: [Buildroot] [git commit] libgpg-error: bump to version 1.12
Message-ID: <20131009202220.065629B9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94161e9b8b6053dd672dae15b8a47b5620cdfb10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpg-error/libgpg-error.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 04874a7..9f5f6c2 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.10
+LIBGPG_ERROR_VERSION = 1.12
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_LICENSE = LGPLv2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
