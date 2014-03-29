From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Mar 2014 20:19:00 -0300
Subject: [Buildroot] [PATCH 2/2] libcgicc: bump to version 3.2.13
In-Reply-To: <1396135140-1402-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396135140-1402-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1396135140-1402-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license files and docs license definition.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcgicc/libcgicc.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index f1c181f..f0b373b 100644
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
+LIBCGICC_LICENSE = LGPLv3+, docs: GFDL1.2+
+LIBCGICC_LICENSE_FILES = COPYING.LIB COPYING.DOC
 LIBCGICC_INSTALL_STAGING = YES
 LIBCGICC_AUTORECONF = YES
 LIBCGICC_CONFIG_SCRIPTS = cgicc-config
-- 
1.8.3.2
