From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:06:32 +0100
Subject: [Buildroot] [git commit] package/apache: bump version to 2.4.18
Message-ID: <20151219131255.E58BE81DCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e2af5eac443746cd26cd81fbf321e6df99ca519
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index e99253a..d4a8a9f 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.17.tar.bz2.sha1
-sha1 3a1b0db8b6c71b9c9ac507ba8723b95a8d3da1df  httpd-2.4.17.tar.bz2
+# From http://www.apache.org/dist/httpd/httpd-2.4.18.tar.bz2.sha1
+sha1	271a129f2f04e3aa694e5c2091df9b707bf8ef80	httpd-2.4.18.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index daf8fe2..8e7b6be 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.17
+APACHE_VERSION = 2.4.18
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
