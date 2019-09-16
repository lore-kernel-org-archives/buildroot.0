From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 16 Sep 2019 23:13:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/mxml: bump to version 3.1
Message-ID: <1568668421-15872-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/michaelrsweet/mxml/releases/tag/v3.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/mxml/mxml.hash | 2 +-
 package/mxml/mxml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
index 3895dcf..811064c 100644
--- a/package/mxml/mxml.hash
+++ b/package/mxml/mxml.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 88f05b3318f29ef6164d99c34b7dced76440c4a99106866b76b7fb729dc8310e mxml-3.0.tar.gz
+sha256 1ac8d252f62f9dc2b2004518c70d2da313bdfcd92b8350e215f46064a34b52fc mxml-3.1.tar.gz
 sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 LICENSE
 sha256 63cc06ba05adecb1fdf2c94460a98291fd71614865456e52a19a1e7cc674250f NOTICE
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 157c644..8ca83e1 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXML_VERSION = 3.0
+MXML_VERSION = 3.1
 MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
 MXML_LICENSE = Apache-2.0 with exceptions
 MXML_LICENSE_FILES = LICENSE NOTICE
-- 
2.7.4
