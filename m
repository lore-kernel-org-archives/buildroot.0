From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Nov 2011 20:56:05 +0100
Subject: [Buildroot] [git commit] radvd: security bump to version 1.8.3
Message-ID: <20111102195838.39A9C8F42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da8ecfeceff9daecc0ffb19520c4db130171c8e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/radvd/radvd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 5d07ff6..d4b9a73 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RADVD_VERSION = 1.8.2
+RADVD_VERSION = 1.8.3
 RADVD_SITE = http://www.litech.org/radvd/dist/
 RADVD_DEPENDENCIES = flex host-flex
 
