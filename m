From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 22:41:06 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] package/logrotate: bump
 to version 3.15.1
Message-ID: <20190904204043.CDD6C813FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c62302f5e21b3556844d908d6fae821d9a55326a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

See https://github.com/logrotate/logrotate/releases/tag/3.15.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bc9487f89d5699cb45ef01953bcefee77bb27061)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index b147405197..6da14797fe 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 011b9e2c7dc785f702f960dc15b7871bd46e53a9a6e336299e4f3d22022986fd  logrotate-3.15.0.tar.gz
+sha256 a7b20f5184c9598c36546f9200d3bd616d561478a0423ab8074e97a1cd7b1c25  logrotate-3.15.1.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index f0d26117ec..831e23935d 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.15.0
+LOGROTATE_VERSION = 3.15.1
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
