From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 22:09:10 +0100
Subject: [Buildroot] [git commit branch/next] liburiparser: bump to version
 0.8.5 and move to GitHub
Message-ID: <20180214210917.BA38B86825@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca0e6272008dfc5e90f3f5a0de5eaa4d345b122e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

uriparser 0.8.5 with bugfixes has been released. It has also moved from
SourceForge to GitHub:

    https://uriparser.github.io/

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liburiparser/Config.in         | 2 +-
 package/liburiparser/liburiparser.hash | 6 ++----
 package/liburiparser/liburiparser.mk   | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/liburiparser/Config.in b/package/liburiparser/Config.in
index e85a2626d2..b39e3907dd 100644
--- a/package/liburiparser/Config.in
+++ b/package/liburiparser/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBURIPARSER
 	  uriparser is a strictly RFC 3986 compliant URI parsing and
 	  handling library written in C.
 
-	  http://uriparser.sourceforge.net
+	  https://uriparser.github.io
diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index 9e9517c17f..c03e832f9f 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,5 +1,3 @@
-# From http://sourceforge.net/projects/uriparser/files/Sources/0.8.4/
-md5	9aabdc3611546f553f4af372167de6d6		uriparser-0.8.4.tar.bz2
-sha1	7a1948c20bed54b04dad0e1d7d2fa8f80fc7b2b3	uriparser-0.8.4.tar.bz2
 # Locally calculated
-sha256  c6ef125800c2ef13a41a22126bfc77e8b8c08993a6b96196117695988ea76249  COPYING
+sha256  58eacd5c03d9e341c04eb0b30831faec89f3b415949ff8d72254e63432352cdd  uriparser-0.8.5.tar.bz2
+sha256  ee90029e62d11f48faa59360d15c3ad8e7c094c74cc25b055716d92340da561f  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 856a6aafd4..4b32b7f7f2 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.8.4
+LIBURIPARSER_VERSION = 0.8.5
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
-LIBURIPARSER_SITE = http://sourceforge.net/projects/uriparser/files/Sources/$(LIBURIPARSER_VERSION)
+LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
 LIBURIPARSER_LICENSE_FILES = COPYING
 LIBURIPARSER_INSTALL_STAGING = YES
