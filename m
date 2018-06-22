From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 22 Jun 2018 06:19:28 +0300
Subject: [Buildroot] [PATCH] edid-decode: update upstream locations
Message-ID: <2fd12ccbfed419704a9f0695a1b744a03dce9770.1529637568.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

edid-decode moved to linuxtv.org. Update homepage link and download
site.

https://www.spinics.net/lists/linux-media/msg136517.html

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/edid-decode/Config.in      | 2 +-
 package/edid-decode/edid-decode.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edid-decode/Config.in b/package/edid-decode/Config.in
index 64297b494dcf..701c70031f96 100644
--- a/package/edid-decode/Config.in
+++ b/package/edid-decode/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_EDID_DECODE
 	help
 	  Decode EDID data in human-readable format.
 
-	  http://cgit.freedesktop.org/xorg/app/edid-decode/
+	  https://git.linuxtv.org/edid-decode.git/
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index a4141b899b70..b412a77a1339 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 EDID_DECODE_VERSION = f56f329ed23a25d002352dedba1e8f092a47286f
-EDID_DECODE_SITE = git://anongit.freedesktop.org/git/xorg/app/edid-decode.git
+EDID_DECODE_SITE = git://linuxtv.org/edid-decode.git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = edid-decode.c
 
-- 
2.17.1
