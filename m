From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 May 2013 12:35:18 +0200
Subject: [Buildroot] [git commit] mongoose: fix license info
Message-ID: <20130503103546.5B6F997287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=841f7858580a805214f014c83bfae2fa7fce4ebf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file is called LICENSE, not COPYING.

Fixes http://autobuild.buildroot.net/results/b45499489abad2a089b47d8470632b4152862c89/build-end.log

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mongoose/mongoose.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index ac03bb6..9905cf9 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -8,7 +8,7 @@ MONGOOSE_VERSION = 3.7
 MONGOOSE_SOURCE = mongoose-$(MONGOOSE_VERSION).tgz
 MONGOOSE_SITE = https://mongoose.googlecode.com/files
 MONGOOSE_LICENSE = MIT
-MONGOOSE_LICENSE_FILES = COPYING
+MONGOOSE_LICENSE_FILES = LICENSE
 
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
 
