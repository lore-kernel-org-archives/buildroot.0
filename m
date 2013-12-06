From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 09:34:10 +0100
Subject: [Buildroot] [git commit] opus-tools: bump version, add license info
Message-ID: <20131206084201.44E989BF48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d04523f8fc818608468adad42163546fe309bcbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus-tools/opus-tools.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index f4dee74..06dc5d4 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-OPUS_TOOLS_VERSION = 0.1.7
+OPUS_TOOLS_VERSION = 0.1.8
 OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
+OPUS_TOOLS_LICENSE = BSD-2c
+OPUS_TOOLS_LICENSE_FILES = COPYING
 OPUS_TOOLS_CONF_OPT = --disable-oggtest --disable-opustest
 OPUS_TOOLS_DEPENDENCIES = opus libogg host-pkgconf
 
