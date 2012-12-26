From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Dec 2012 23:37:56 +0100
Subject: [Buildroot] [git commit] dosfstools: fix download link
Message-ID: <20121226224224.A59EE9A494@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0810280fec7745b2534c2fa9d0526115e05b26f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mikhail Boiko <mikhailboiko85@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dosfstools/dosfstools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 08201d3..507f485 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 DOSFSTOOLS_VERSION = 3.0.12
-DOSFSTOOLS_SITE = http://www.daniel-baumann.ch/software/dosfstools
+DOSFSTOOLS_SITE = http://fossies.org/linux/misc/
 MKDOSFS_BINARY = mkdosfs
 DOSFSCK_BINARY = dosfsck
 DOSFSLABEL_BINARY = dosfslabel
