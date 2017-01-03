From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 16:24:02 +0100
Subject: [Buildroot] [git commit] freetype: bump to version 2.7.1
Message-ID: <20170103152906.909957F94A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e759f8dcb8eea6e13c0fbe56504fae23751f0b22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.hash | 2 +-
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index d56742c..b2cec04 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d6a451f5b754857d2aa3964fd4473f8bc5c64e879b24516d780fb26bec7f7d48	freetype-2.7.tar.bz2
+sha256	3a3bb2c4e15ffb433f2032f50a5b5a92558206822e22bfe8cbe339af4aa82f88	freetype-2.7.1.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 8a9a285..9484758 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.7
+FREETYPE_VERSION = 2.7.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
