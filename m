From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 22:52:56 +0200
Subject: [Buildroot] [git commit] mongoose: bump version
Message-ID: <20130502210337.975E1999C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aabc7475e6f8f85344fe13d3a603a69cb8d1099e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mongoose/mongoose.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 5ebeb24..4f7df17 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MONGOOSE_VERSION = 3.3
+MONGOOSE_VERSION = 3.7
 MONGOOSE_SOURCE = mongoose-$(MONGOOSE_VERSION).tgz
 MONGOOSE_SITE = https://mongoose.googlecode.com/files
 MONGOOSE_LICENSE = MIT
