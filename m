From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 23:04:49 +0200
Subject: [Buildroot] [git commit] package/libroxml: bump to version 3.0.2
Message-ID: <20191002210033.879F8883DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5b9a9f28e3d233f9a9cc12c613553761254820e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libroxml/libroxml.hash | 2 +-
 package/libroxml/libroxml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libroxml/libroxml.hash b/package/libroxml/libroxml.hash
index 897030ed73..2e01a54985 100644
--- a/package/libroxml/libroxml.hash
+++ b/package/libroxml/libroxml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	b55fd616a2be4e9747173b8dfa4bbab64f5ddfafd7d7a529aa91ab7755bc0ce6	libroxml-3.0.1.tar.gz
+sha256	ed6d68d1bceabf98e5e76907411e2e4d93b2dbd48479ab41dede851f59dad6a3	libroxml-3.0.2.tar.gz
 sha256	fe11466c265ad0a6c3896ea113af9403c0a8372b1fdd78712db64f0f1bac6387	License.txt
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index fef3c2795f..7e2488aea4 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBROXML_VERSION = 3.0.1
+LIBROXML_VERSION = 3.0.2
 LIBROXML_SITE = http://download.libroxml.net/pool/v3.x
 LIBROXML_INSTALL_STAGING = YES
 LIBROXML_LICENSE = LGPL-2.1+ with static link exception
