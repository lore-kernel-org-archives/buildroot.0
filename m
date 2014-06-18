From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 13:56:37 +0200
Subject: [Buildroot] [git commit] opus-tools: bump to version 0.1.9
Message-ID: <20140618123419.A59149CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b94777220a17c269cd6e82d681a4b29351773e1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus-tools/opus-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index 06dc5d4..e314eef 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_TOOLS_VERSION = 0.1.8
+OPUS_TOOLS_VERSION = 0.1.9
 OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_TOOLS_LICENSE = BSD-2c
 OPUS_TOOLS_LICENSE_FILES = COPYING
