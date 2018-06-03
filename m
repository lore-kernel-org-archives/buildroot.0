From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:40:05 +0200
Subject: [Buildroot] [git commit] libroxml: bump to version 3.0.1
Message-ID: <20180603183910.6F54480F9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=407fb2fe202aaeb273e4986dc88c30596a7fe8db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libroxml/libroxml.hash | 3 ++-
 package/libroxml/libroxml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libroxml/libroxml.hash b/package/libroxml/libroxml.hash
index 32482e65de..897030ed73 100644
--- a/package/libroxml/libroxml.hash
+++ b/package/libroxml/libroxml.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	1da8f20b530eba4409f2b217587d2f1281ff5d9ba45b24aeac71b94c6c621b78	libroxml-2.3.0.tar.gz
+sha256	b55fd616a2be4e9747173b8dfa4bbab64f5ddfafd7d7a529aa91ab7755bc0ce6	libroxml-3.0.1.tar.gz
+sha256	fe11466c265ad0a6c3896ea113af9403c0a8372b1fdd78712db64f0f1bac6387	License.txt
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 5582b387d4..fef3c2795f 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBROXML_VERSION = 2.3.0
-LIBROXML_SITE = http://download.libroxml.net/pool/v2.x
+LIBROXML_VERSION = 3.0.1
+LIBROXML_SITE = http://download.libroxml.net/pool/v3.x
 LIBROXML_INSTALL_STAGING = YES
 LIBROXML_LICENSE = LGPL-2.1+ with static link exception
 LIBROXML_LICENSE_FILES = License.txt
