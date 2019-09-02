From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 15:57:31 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/batctl: fix
 license
Message-ID: <20190902135323.B97707FC40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dbd5c79496552f77332da6cbf69470725f0514c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

batman_adv.h and list.h are licensed under MIT

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5aea15be98be9fc0e9c1e4bc3cd02c1a011cd8c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/batctl/batctl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index 122263e460..824d2e15f5 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -6,7 +6,7 @@
 
 BATCTL_VERSION = 2017.0
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
-BATCTL_LICENSE = GPL-2.0
+BATCTL_LICENSE = GPL-2.0, MIT (batman_adv.h, list.h)
 BATCTL_DEPENDENCIES = libnl host-pkgconf
 
 define BATCTL_BUILD_CMDS
