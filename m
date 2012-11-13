From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:06:00 +0100
Subject: [Buildroot] [PATCH 26/30] usbutils: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-26-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/usbutils/usbutils.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 87ae4b3..05573ed 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -11,6 +11,8 @@ USBUTILS_DEPENDENCIES = host-pkgconf libusb
 USBUTILS_INSTALL_STAGING = YES
 # no configure in tarball
 USBUTILS_AUTORECONF = YES
+USBUTILS_LICENSE = GPLv2+
+USBUTILS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 	USBUTILS_DEPENDENCIES += zlib
-- 
1.7.10.4
