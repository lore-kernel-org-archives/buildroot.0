From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 23:21:11 +0100
Subject: [Buildroot] [git commit] package/libedit: bump version to
 20191231-3.1
Message-ID: <20210207220146.B2B39818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88cfa4ad079ddda876260f799e975f3e5e12dbc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libedit/libedit.hash | 4 ++--
 package/libedit/libedit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libedit/libedit.hash b/package/libedit/libedit.hash
index 7b84909d8b..d405e47b42 100644
--- a/package/libedit/libedit.hash
+++ b/package/libedit/libedit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ac8f0f51c1cf65492e4d1e3ed2be360bda41e54633444666422fbf393bba1bae libedit-20190324-3.1.tar.gz
-sha256 9da6c9c74987a36c84302982799d17d2f748ba1c1c0c471425716173c1d07649 COPYING
+sha256  dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071  libedit-20191231-3.1.tar.gz
+sha256  9da6c9c74987a36c84302982799d17d2f748ba1c1c0c471425716173c1d07649  COPYING
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 0a9b28afa7..cb18b97f6d 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION = 20190324-3.1
+LIBEDIT_VERSION = 20191231-3.1
 LIBEDIT_SITE = http://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
