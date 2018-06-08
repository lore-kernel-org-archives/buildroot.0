From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  8 Jun 2018 12:42:21 +0300
Subject: [Buildroot] [PATCH] libedit: bump to version 20180525-3.1
Message-ID: <dfc2fd05b10fa7e1cf1b46d9f80c6fb091222776.1528450941.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libedit/libedit.hash | 2 +-
 package/libedit/libedit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libedit/libedit.hash b/package/libedit/libedit.hash
index e8136df9c49d..3a5cdbac95c9 100644
--- a/package/libedit/libedit.hash
+++ b/package/libedit/libedit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 91f2d90fbd2a048ff6dad7131d9a39e690fd8a8fd982a353f1333dd4017dd4be libedit-20170329-3.1.tar.gz
+sha256 c41bea8fd140fb57ba67a98ec1d8ae0b8ffa82f4aba9c35a87e5a9499e653116 libedit-20180525-3.1.tar.gz
 sha256 9da6c9c74987a36c84302982799d17d2f748ba1c1c0c471425716173c1d07649 COPYING
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index bbdc871b35b8..a4b32e05eb33 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION = 20170329-3.1
+LIBEDIT_VERSION = 20180525-3.1
 LIBEDIT_SITE = http://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
-- 
2.17.1
