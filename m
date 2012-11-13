From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 13 Nov 2012 12:57:08 +0000
Subject: [Buildroot] [PATCH] python-nfc: bump version
Message-ID: <1352811428-5791-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/python-nfc/python-nfc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
index 90f7c46..a053b2c 100644
--- a/package/python-nfc/python-nfc.mk
+++ b/package/python-nfc/python-nfc.mk
@@ -3,7 +3,7 @@
 # python-nfc
 #
 #############################################################
-PYTHON_NFC_VERSION = 112
+PYTHON_NFC_VERSION = 142
 PYTHON_NFC_SITE = https://launchpad.net/nfcpy
 PYTHON_NFC_SITE_METHOD = bzr
 PYTHON_NFC_DEPENDENCIES = python libusb libusb-compat
-- 
1.7.10.4
