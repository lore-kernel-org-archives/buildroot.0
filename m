From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:29:17 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/libev: fix
	download URL
Message-ID: <20170601144623.DC95D8296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9af8504a4d036e84f3fbcf9af33744d4b361b13d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 3f0cdaad8b0b797f5727a35737a0badd97cb3ddc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libev/libev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 02bc72c..8925a62 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEV_VERSION = 4.22
-LIBEV_SITE = http://dist.schmorp.de/libev
+LIBEV_SITE = http://dist.schmorp.de/libev/Attic
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2c or GPLv2+
 LIBEV_LICENSE_FILES = LICENSE
