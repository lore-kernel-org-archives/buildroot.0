From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 21:53:19 +0200
Subject: [Buildroot] [git commit] package/libev: fix download URL
Message-ID: <20170529195333.A7B76827CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f0cdaad8b0b797f5727a35737a0badd97cb3ddc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libev/libev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 2e3ed45..87cdd6f 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEV_VERSION = 4.22
-LIBEV_SITE = http://dist.schmorp.de/libev
+LIBEV_SITE = http://dist.schmorp.de/libev/Attic
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
 LIBEV_LICENSE_FILES = LICENSE
