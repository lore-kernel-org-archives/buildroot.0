From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Sep 2013 23:58:05 +0200
Subject: [Buildroot] [git commit] opus-tools: bump version
Message-ID: <20130909094042.6B14F9A13D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0175dce8bce9528bf7600e43158cfcf7e9b18331
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/opus-tools/opus-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index 66bd9f0..bb11a19 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_TOOLS_VERSION = 0.1.6
+OPUS_TOOLS_VERSION = 0.1.7
 OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_TOOLS_CONF_OPT = --disable-oggtest --disable-opustest
 OPUS_TOOLS_DEPENDENCIES = opus libogg host-pkgconf
