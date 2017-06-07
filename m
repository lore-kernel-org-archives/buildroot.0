From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jun 2017 09:23:09 +0200
Subject: [Buildroot] [git commit] package/libhdhomerun: fix legal-info
Message-ID: <20170607073013.D1F6E8082C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a0772c1e6572565532a9d90c08b06bb8a6aca2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/8ea/8eaa8c4027bca26d5a21da83f67358a43627f1b2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhdhomerun/libhdhomerun.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index 4240ce1..b624400 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -8,7 +8,7 @@ LIBHDHOMERUN_VERSION = 20161117
 LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
 LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
 LIBHDHOMERUN_LICENSE = LGPL-2.1+
-LIBHDHOMERUN_LICENSE_FILES = lgpl.txt
+LIBHDHOMERUN_LICENSE_FILES = LICENSE
 LIBHDHOMERUN_INSTALL_STAGING = YES
 
 define LIBHDHOMERUN_BUILD_CMDS
