From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:52:30 +0200
Subject: [Buildroot] [git commit] package/x11r7/xfont_encodings: bump
 version to 1.0.5
Message-ID: <20190623105426.568B58293F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eef40d0f495cdba812afa90e04946208b1d4fb54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream, added license hash.

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xfont_encodings/xfont_encodings.hash | 9 +++++++--
 package/x11r7/xfont_encodings/xfont_encodings.mk   | 4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.hash b/package/x11r7/xfont_encodings/xfont_encodings.hash
index 56c1ad2737..30dc92760b 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.hash
+++ b/package/x11r7/xfont_encodings/xfont_encodings.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2010-October/001466.html
-sha1	24ace2470403f85a0d393769204029bd8247992a	encodings-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-June/002998.html
+md5 bbae4f247b88ccde0e85ed6a403da22a  encodings-1.0.5.tar.bz2
+sha1 7ffec76dba1cfd5040c5b43ccfae930c83ddf92e  encodings-1.0.5.tar.bz2
+sha256 bd96e16143a044b19e87f217cf6a3763a70c561d1076aad6f6d862ec41774a31  encodings-1.0.5.tar.bz2
+sha512 920e49f0b3545f181a1574ca3280ac9adef1e68fe27566c195dd7013f728d355c0d759132789357fcf8fa7391fcbe1e17edf2bd85aa5611df5a4d99740011008  encodings-1.0.5.tar.bz2
+# Locally computed
+sha256 13b4a0f9431f0fdd6ee36ed386e0b7d1eb429c5cb88df73353896078cbb5a137  COPYING
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 9c5c9f30bf..06d9973813 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_ENCODINGS_VERSION = 1.0.4
+XFONT_ENCODINGS_VERSION = 1.0.5
 XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
-XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_ENCODINGS_SITE = https://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_LICENSE = Public Domain
 XFONT_ENCODINGS_LICENSE_FILES = COPYING
 
