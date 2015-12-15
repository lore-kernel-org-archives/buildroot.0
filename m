From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:03:59 +0100
Subject: [Buildroot] [git commit] webkitgtk24: comma separate licenses
Message-ID: <20151215210844.B68E580409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2704ff14047e01c041aceda7ead5f9fb3b797ed5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkitgtk24/webkitgtk24.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
index 3be1cc7..712120c 100644
--- a/package/webkitgtk24/webkitgtk24.mk
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -8,7 +8,7 @@ WEBKITGTK24_VERSION = 2.4.9
 WEBKITGTK24_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK24_SOURCE = webkitgtk-$(WEBKITGTK24_VERSION).tar.xz
 WEBKITGTK24_INSTALL_STAGING = YES
-WEBKITGTK24_LICENSE = LGPLv2+ BSD-2c
+WEBKITGTK24_LICENSE = LGPLv2+, BSD-2c
 WEBKITGTK24_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2
