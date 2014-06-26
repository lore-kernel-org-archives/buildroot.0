From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:09 -0300
Subject: [Buildroot] [PATCH 41/53] python-nfc: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-41-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-nfc/python-nfc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
index 4c14a17..87db577 100644
--- a/package/python-nfc/python-nfc.mk
+++ b/package/python-nfc/python-nfc.mk
@@ -9,5 +9,6 @@ PYTHON_NFC_SITE = https://launchpad.net/nfcpy
 PYTHON_NFC_SITE_METHOD = bzr
 PYTHON_NFC_DEPENDENCIES = libusb libusb-compat
 PYTHON_NFC_SETUP_TYPE = distutils
+PYTHON_NFC_LICENSE = EUPLv1.1+
 
 $(eval $(python-package))
-- 
1.8.5.5
