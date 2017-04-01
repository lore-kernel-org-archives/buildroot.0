From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  2 Apr 2017 00:36:29 +0530
Subject: [Buildroot] [PATCH 7/9] python-nfc: use SPDX short identifier for
	EUPL license
In-Reply-To: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491073591-21477-7-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/python-nfc/python-nfc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
index 87db577..574d2e5 100644
--- a/package/python-nfc/python-nfc.mk
+++ b/package/python-nfc/python-nfc.mk
@@ -9,6 +9,6 @@ PYTHON_NFC_SITE = https://launchpad.net/nfcpy
 PYTHON_NFC_SITE_METHOD = bzr
 PYTHON_NFC_DEPENDENCIES = libusb libusb-compat
 PYTHON_NFC_SETUP_TYPE = distutils
-PYTHON_NFC_LICENSE = EUPLv1.1+
+PYTHON_NFC_LICENSE = EUPL-1.1+
 
 $(eval $(python-package))
-- 
2.7.4
