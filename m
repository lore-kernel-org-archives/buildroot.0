From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Dec 2012 23:55:10 +0100
Subject: [Buildroot] [git commit] opus: bump version
Message-ID: <20121214230749.4918F9A1FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df6e849d4ed3bfcac50cf2bd9c94fabd7545fb68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/opus/opus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 177adfb..adaebfb 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPUS_VERSION = 1.0.1
+OPUS_VERSION = 1.0.2
 OPUS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_INSTALL_STAGING = YES
 OPUS_CONF_OPT = --disable-doc
