From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:34:29 +0200
Subject: [Buildroot] [git commit] package/filemq: bump version
Message-ID: <20160605200530.174057FB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=182bf47cae9c0c3847aeff7abb792d946e76f74a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/filemq/filemq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index a79e8f4..0e73591 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = acf6c0e003fee938994ad803aa7b78245dca57ba
+FILEMQ_VERSION = e59951489045825d6fc5bdc6a5a5ecf1abf51943
 FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
