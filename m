From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jan 2014 09:54:47 +0100
Subject: [Buildroot] [git commit] rings: bump to version 1.3.0
Message-ID: <20140114085542.234719C4BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1019e0cae180f41942a6da5cf9d9fad362eb0b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rings/rings.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index c23f879..d052f5d 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-RINGS_VERSION = 1.2.3-2
+RINGS_VERSION = 1.3.0-1
+RINGS_SUBDIR  = rings-v_1_3_0
 RINGS_LICENSE = MIT
 
 $(eval $(luarocks-package))
