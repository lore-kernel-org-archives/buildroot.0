From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:50:45 +0200
Subject: [Buildroot] [git commit] fontconfig: add explicit dependencies for
	host variant
Message-ID: <20160703065521.9F53180434@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42a2d5c5059ab88f217f6b57a907d1237454b433
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fontconfig/fontconfig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index caf997b..f3bf0d4 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -8,6 +8,7 @@ FONTCONFIG_VERSION = 2.11.1
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf
+HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 
