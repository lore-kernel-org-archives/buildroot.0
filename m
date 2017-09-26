From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Sep 2017 18:46:13 +0300
Subject: [Buildroot] [PATCH] edid-decode: bump to latest version
Message-ID: <7652b730442a316fbd026f455599839526ccb9f1.1506440773.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version brings bug fixes and improvements.

http://www.spinics.net/lists/linux-media/msg122284.html

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/edid-decode/edid-decode.hash | 2 +-
 package/edid-decode/edid-decode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 0c2c6a2cf5c2..437dcf4a6623 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ec85b62e863a1ad4636e1a216c122e459d7847c71ff6d57e4bf44406d9cbeb40  edid-decode-681153145d5e05ee15032ea792e967cda06e7622.tar.gz
+sha256 94f43f93285eb5cf8133061295bcdf72b6897bf5372879c2e4032a08d359af12  edid-decode-f56f329ed23a25d002352dedba1e8f092a47286f.tar.gz
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index 243ccfbea689..a4141b899b70 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDID_DECODE_VERSION = 681153145d5e05ee15032ea792e967cda06e7622
+EDID_DECODE_VERSION = f56f329ed23a25d002352dedba1e8f092a47286f
 EDID_DECODE_SITE = git://anongit.freedesktop.org/git/xorg/app/edid-decode.git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = edid-decode.c
-- 
2.14.1
