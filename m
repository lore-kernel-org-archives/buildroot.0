From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Apr 2019 22:42:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/linknx: add license file
Message-ID: <20190420204252.26815-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE has been added in version 0.0.1.32 with
https://github.com/linknx/linknx/commit/74671aa27931be40662c0266441c7470dc11d595

So add it to LINKNX_LICENSE_FILES as well as its hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linknx/linknx.hash | 1 +
 package/linknx/linknx.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/linknx/linknx.hash b/package/linknx/linknx.hash
index 40e26766e2..312e43bfd3 100644
--- a/package/linknx/linknx.hash
+++ b/package/linknx/linknx.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256 635b8fbd3477fd7d85a95955b93f327cd5a389db80dc18cdae04de19a3a8a972  linknx-0.0.1.33.tar.gz
+sha256 c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad  LICENSE
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index dfabef550e..5801eb5f87 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -7,6 +7,7 @@
 LINKNX_VERSION = 0.0.1.33
 LINKNX_SITE = $(call github,linknx,linknx,$(LINKNX_VERSION))
 LINKNX_LICENSE = GPL-2.0+
+LINKNX_LICENSE_FILES = LICENSE
 LINKNX_INSTALL_STAGING = YES
 LINKNX_CONF_OPTS = \
 	--without-log4cpp \
-- 
2.20.1
