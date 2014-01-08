From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jan 2014 23:18:45 +0100
Subject: [Buildroot] [git commit] python-nfc: bump version
Message-ID: <20140108222025.E008B9C3E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf93f6a2e2f22f10e7257c0e987a2c319df1519a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-nfc/python-nfc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
