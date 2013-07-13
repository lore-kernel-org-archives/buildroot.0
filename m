From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 13 Jul 2013 21:34:47 +0200
Subject: [Buildroot] [git commit] opus: bump version
Message-ID: <20130713193500.A155B9A3F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36db329ede5bd83661dbcd6a69a95442296c1f93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/opus/opus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 043d4b0..9668854 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.0.2
+OPUS_VERSION = 1.0.3
 OPUS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_INSTALL_STAGING = YES
 OPUS_CONF_OPT = --disable-doc
