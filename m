From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Sep 2013 11:47:16 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump for misc fixes
Message-ID: <20130923074447.38CFB9B847@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7a0eb4d0f8abf69f1583e2ffa58b22d83002a74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest cset in master for a bunch of fixes
for transconding, muxer and html5 video.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tvheadend/tvheadend.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 2a09263..5593791 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION           = 5956233
+TVHEADEND_VERSION           = 2b64995
 TVHEADEND_SITE              = git://github.com/tvheadend/tvheadend.git
 TVHEADEND_LICENSE           = GPLv3+
 TVHEADEND_LICENSE_FILES     = LICENSE
