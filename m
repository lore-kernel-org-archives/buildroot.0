From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 22:47:08 +0200
Subject: [Buildroot] [git commit] linenoise: bump to version 1.0
Message-ID: <20150602205021.D08B680187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5174eb2eed2c2bdab0e3980e258156fbd1daef81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linenoise/linenoise.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 7321564..64a7b7c 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = cf1bdf5f89e10b504a0bec3efc8a8587eadecd2c
+LINENOISE_VERSION = 1.0
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_LICENSE_FILES = LICENSE
