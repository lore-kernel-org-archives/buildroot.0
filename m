From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 22:39:17 +0200
Subject: [Buildroot] [git commit] package/gensio: bump to version 2.1.5
Message-ID: <20200921203840.47F928D4C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cef96225134faafe736f07f11a56838e5ed1037
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index b83f21abd0..ecf9d5e159 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  e2547078bd73d62abda343515f1368ee  gensio-2.1.4.tar.gz
-sha1  f8c0e787fad22a71b10f1d8eefea83617f489bdb  gensio-2.1.4.tar.gz
+md5  bef0312c68ef541f85893c6bc85930ed  gensio-2.1.5.tar.gz
+sha1  f23b4017aba5a6f9066f734ffb600fa36b1399c0  gensio-2.1.5.tar.gz
 # Locally computed:
-sha256  1f5a29aabfb35886893cfda5cd78192db67e96de796dbf9758dbecd4077a3fd8  gensio-2.1.4.tar.gz
+sha256  e497043a0415177652bfb2b1d045e4605cd5726bbcfe790ef6f555ac25825c12  gensio-2.1.5.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 89b7be9cdc..1170ec00f4 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.1.4
+GENSIO_VERSION = 2.1.5
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
