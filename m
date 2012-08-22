From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 21 Aug 2012 20:54:20 -0400
Subject: [Buildroot] [PATCH] fontconfig: add license info [v2]
Message-ID: <1345596860-3362-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/fontconfig/fontconfig.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 843b34f..9845656 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -6,6 +6,8 @@
 FONTCONFIG_VERSION = 2.6.0
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
 FONTCONFIG_SITE = http://fontconfig.org/release
+FONTCONFIG_LICENSE = fontconfig license
+FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
 # This package does not like using the target cflags for some reason.
-- 
1.7.9.5
