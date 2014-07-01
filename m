From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:31:34 +0200
Subject: [Buildroot] [git commit] python-nfc: add license information
Message-ID: <20140701224922.45F569D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bafbcca553c52f2c81cf6dbebf14d16514c0859
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-nfc/python-nfc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
