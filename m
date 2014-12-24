From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Dec 2014 14:58:51 +0100
Subject: [Buildroot] [git commit] gettext: bump to version 0.19.4
Message-ID: <20141224135935.D5BC880788@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c90515124ee1eff9896cdbd5bcb3c1bd7c4dbcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.hash |    6 +++---
 package/gettext/gettext.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
index d93eba1..db5a0ed 100644
--- a/package/gettext/gettext.hash
+++ b/package/gettext/gettext.hash
@@ -1,3 +1,3 @@
-# From http://lists.gnu.org/archive/html/bug-gettext/2014-10/msg00025.html
-md5	092c3f460553ceb4a638ff81d36434c4	gettext-0.19.3.tar.xz
-sha1	5c8e37c5275742b6acc1257e2df9b5d1874c12e3	gettext-0.19.3.tar.xz
+# From http://lists.gnu.org/archive/html/bug-gettext/2014-12/msg00038.html
+md5	997c9070354eff5517115feaea6038f0	gettext-0.19.4.tar.xz
+sha1	16c90342f3a59c7df364ebb3209a48be42b7ffd9	gettext-0.19.4.tar.xz
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 2b7b4f2..c2419c1 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.19.3
+GETTEXT_VERSION = 0.19.4
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
