From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Jan 2014 18:16:28 +0100
Subject: [Buildroot] [git commit] libcgicc: bump to version 3.2.12
Message-ID: <20140101180525.8203B9C32D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa24894c2f3288494d1bced7f056b834520bf145
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...libcgicc-01-disable-documentation-option.patch} |    0
 package/libcgicc/libcgicc.mk                       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcgicc/libcgicc-3.2.9-disable-documentation-option.patch b/package/libcgicc/libcgicc-01-disable-documentation-option.patch
similarity index 100%
rename from package/libcgicc/libcgicc-3.2.9-disable-documentation-option.patch
rename to package/libcgicc/libcgicc-01-disable-documentation-option.patch
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index a3c64d2..f1c181f 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION = 3.2.9
+LIBCGICC_VERSION = 3.2.12
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_LICENSE = LGPLv3+
