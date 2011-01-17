From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] dosfstools: bump to version
	3.0.11
Message-ID: <20110117202411.723F789008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=13b81880c84f90280764c8d834a5bb084ad00cf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dosfstools/dosfstools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 8e6cfc9..c2d763d 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -3,7 +3,7 @@
 # dosfstools
 #
 #############################################################
-DOSFSTOOLS_VERSION = 3.0.10
+DOSFSTOOLS_VERSION = 3.0.11
 DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.gz
 DOSFSTOOLS_SITE = http://www.daniel-baumann.ch/software/dosfstools
 MKDOSFS_BINARY = mkdosfs
-- 
1.7.3.4
