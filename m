From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Apr 2012 23:20:07 +0200
Subject: [Buildroot] [git commit] iw: bump to 3.4
Message-ID: <20120402212946.8808B969E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09a1de0fb86f3af35878b26046df02b4620fe7b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 38bb125..5cd40a3 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IW_VERSION = 3.3
+IW_VERSION = 3.4
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkg-config libnl
