From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 22:45:20 +0100
Subject: [Buildroot] [git commit branch/next] package/libedit: bump version
 to 20190324-3.1
Message-ID: <20191124213953.E01C580266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75ea09dc567c499658a6236d653de5ecb67ceba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libedit/libedit.hash | 2 +-
 package/libedit/libedit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libedit/libedit.hash b/package/libedit/libedit.hash
index 3a5cdbac95..7b84909d8b 100644
--- a/package/libedit/libedit.hash
+++ b/package/libedit/libedit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c41bea8fd140fb57ba67a98ec1d8ae0b8ffa82f4aba9c35a87e5a9499e653116 libedit-20180525-3.1.tar.gz
+sha256 ac8f0f51c1cf65492e4d1e3ed2be360bda41e54633444666422fbf393bba1bae libedit-20190324-3.1.tar.gz
 sha256 9da6c9c74987a36c84302982799d17d2f748ba1c1c0c471425716173c1d07649 COPYING
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index a4b32e05eb..0a9b28afa7 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION = 20180525-3.1
+LIBEDIT_VERSION = 20190324-3.1
 LIBEDIT_SITE = http://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
