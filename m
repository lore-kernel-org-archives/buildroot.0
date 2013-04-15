From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 15 Apr 2013 07:29:10 +0100
Subject: [Buildroot] [PATCH] ofono: add license information
Message-ID: <1366007350-2884-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/ofono/ofono.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 5410c98..9b1181a 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -3,8 +3,11 @@
 # ofono
 #
 #############################################################
+
 OFONO_VERSION = 1.12
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
+OFONO_LICENSE = GPLv2
+OFONO_LICENSE_FILES = COPYING
 OFONO_DEPENDENCIES = \
 	host-pkgconf \
 	dbus \
-- 
1.7.10.4
