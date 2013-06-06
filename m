From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 11:47:27 -0500
Subject: [Buildroot] [PATCH 12/14] sunxi-tools: fix github tarball to use
	commit id
In-Reply-To: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370537249-15682-12-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/sunxi-tools/sunxi-tools.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index a97dfcb..51b7aad 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 SUNXI_TOOLS_VERSION = 3a94e721dd8d1e13d0b25da0a83463891e8e9ee0
-SUNXI_TOOLS_SITE = http://github.com/linux-sunxi/sunxi-tools/tarball/master
+SUNXI_TOOLS_SITE = http://github.com/linux-sunxi/sunxi-tools/tarball/$(SUNXI_TOOLS_VERSION)
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb
-- 
1.7.9.5
