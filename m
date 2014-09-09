From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Sep 2014 23:05:57 +0200
Subject: [Buildroot] [git commit] linenoise: bump version
Message-ID: <20140909210718.12ED59D64B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=692f0dcc868884f41f515058a11548b885e04c21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linenoise/linenoise.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 4cb1427..562b445 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = 27a3b4d5205a5fb3e2101128edd6653bd0c92189
+LINENOISE_VERSION = 828b9dacc52d4ad5a15c89be8fb8691d224f9a4f
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_INSTALL_STAGING = YES
