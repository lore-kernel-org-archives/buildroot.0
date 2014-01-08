From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  8 Jan 2014 08:47:54 +0000
Subject: [Buildroot] [PATCH] python-nfc: bump version
Message-ID: <1389170874-13922-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/python-nfc/python-nfc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
index 5f486d9..4c14a17 100644
--- a/package/python-nfc/python-nfc.mk
+++ b/package/python-nfc/python-nfc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NFC_VERSION = 142
+PYTHON_NFC_VERSION = 212
 PYTHON_NFC_SITE = https://launchpad.net/nfcpy
 PYTHON_NFC_SITE_METHOD = bzr
 PYTHON_NFC_DEPENDENCIES = libusb libusb-compat
-- 
1.8.3.2
