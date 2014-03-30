From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 11:28:45 +0200
Subject: [Buildroot] [git commit] libcgicc: bump to version 3.2.13
Message-ID: <20140330092855.90FF09BFEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f76aa49269c210ecd597941c5e4b6365dfa01c0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license files and docs license definition.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcgicc/libcgicc.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index f1c181f..cf83d82 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION = 3.2.12
+LIBCGICC_VERSION = 3.2.13
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
-LIBCGICC_LICENSE = LGPLv3+
+LIBCGICC_LICENSE = LGPLv3+ (library), GFDL1.2+ (docs)
+LIBCGICC_LICENSE_FILES = COPYING.LIB COPYING.DOC
 LIBCGICC_INSTALL_STAGING = YES
 LIBCGICC_AUTORECONF = YES
 LIBCGICC_CONFIG_SCRIPTS = cgicc-config
