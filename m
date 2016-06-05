From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:35:08 +0200
Subject: [Buildroot] [git commit] package/glmark2: bump version
Message-ID: <20160605200530.237197FB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=878108c56034c77233e64e053756ad6a3daee57c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glmark2/glmark2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index bd5b51a..2f662fe 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLMARK2_VERSION = 499aa81a68fb4c8aac1c80f0d6a4cce05941c4cc
+GLMARK2_VERSION = fa71af2dfab711fac87b9504b6fc9862f44bf72a
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
 GLMARK2_LICENSE = GPLv3+ SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
