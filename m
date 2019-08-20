From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:31:01 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libshout: move
 site to https
Message-ID: <20190820142829.DCDB081484@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=518d87d4f2693d16da6ae8f913adf12830fc856d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Move site from http to https as HTTP URL now returns
"301 Moved Permanently"

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e7609a80b6c22fa6d8f82773fab49e4324bafc06)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libshout/libshout.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 4f209081a4..375ce05b4b 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSHOUT_VERSION = 2.4.1
-LIBSHOUT_SITE = http://downloads.xiph.org/releases/libshout
+LIBSHOUT_SITE = https://downloads.xiph.org/releases/libshout
 LIBSHOUT_LICENSE = LGPL-2.0+
 LIBSHOUT_LICENSE_FILES = COPYING
 LIBSHOUT_INSTALL_STAGING = YES
