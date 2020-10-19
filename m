From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 19 Oct 2020 20:28:49 +0200
Subject: [Buildroot] [PATCH] package/mxml: bump to version 3.2
Message-ID: <1603132129-2372-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hash of the NOTICE file has changed due to the following minor update:

-Exceptions to the Apache 2.0 License:
-=====================================
+(Optional) Exceptions to the Apache 2.0 License:
+================================================

Also update hash file formatting (2 spaces)

See changelog https://github.com/michaelrsweet/mxml/releases/tag/v3.2

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/mxml/mxml.hash | 6 +++---
 package/mxml/mxml.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
index 811064c..70f82ca 100644
--- a/package/mxml/mxml.hash
+++ b/package/mxml/mxml.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 1ac8d252f62f9dc2b2004518c70d2da313bdfcd92b8350e215f46064a34b52fc mxml-3.1.tar.gz
-sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 LICENSE
-sha256 63cc06ba05adecb1fdf2c94460a98291fd71614865456e52a19a1e7cc674250f NOTICE
+sha256  b894f6c64964f2e77902564c17ba00f5d077a7a24054e7c1937903b0bd42c974  mxml-3.2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
+sha256  ed63aec4c75b9c21a5156b40052138032269bd27fd6f4bc0c51389807cdc7db9  NOTICE
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 8ca83e1..85930ab 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXML_VERSION = 3.1
+MXML_VERSION = 3.2
 MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
 MXML_LICENSE = Apache-2.0 with exceptions
 MXML_LICENSE_FILES = LICENSE NOTICE
-- 
2.7.4
