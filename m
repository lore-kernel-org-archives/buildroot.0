From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 18:11:07 +0200
Subject: [Buildroot] [git commit] package/duktape: bump to version 2.4.0
Message-ID: <20190801160829.B974D8139B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2174355059adb451fc55cc0cece68c0fda92c2e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash for license file (update in year:
https://github.com/svaarala/duktape/commit/bcb37439d6b0a589707f4d611962d7381868dce4)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/duktape/duktape.hash | 4 ++--
 package/duktape/duktape.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/duktape/duktape.hash b/package/duktape/duktape.hash
index f0e2a71d4d..c5c4682696 100644
--- a/package/duktape/duktape.hash
+++ b/package/duktape/duktape.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	0df1c0a9d40bfae31733e5c44f0eabaeae59e0a2ebf7693ff68bbabd49aae331	duktape-2.3.0.tar.gz
-sha256	9aabee442709a6e7652348b9617ae26d26da6b270c1f4b6fce4a1e746acb3df0	LICENSE.txt
+sha256	4b022e040f10d6ead4fd3d0c865ca97d1679fc39307d4d3fa4a7f463ee4b9658	duktape-2.4.0.tar.gz
+sha256	5b42d02dbd084fd6d7e61d93f52e02b596f25400e54e0f86d5780045e5b754c8	LICENSE.txt
diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index 7d7eb15f8f..30efaf5fa1 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUKTAPE_VERSION = 2.3.0
+DUKTAPE_VERSION = 2.4.0
 DUKTAPE_SITE = $(call github,svaarala,duktape-releases,v$(DUKTAPE_VERSION))
 DUKTAPE_LICENSE = MIT
 DUKTAPE_LICENSE_FILES = LICENSE.txt
