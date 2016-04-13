From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 21:36:43 +0200
Subject: [Buildroot] [git commit] apache: bump to version 2.4.20
Message-ID: <20160413193651.D973D807EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07e4772115a82e7b7c3287f78886e8675a74fd28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index d4a8a9f..062a549 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.18.tar.bz2.sha1
-sha1	271a129f2f04e3aa694e5c2091df9b707bf8ef80	httpd-2.4.18.tar.bz2
+# From http://www.apache.org/dist/httpd/httpd-2.4.20.tar.bz2.sha1
+sha1	cefe8ea4a3f81c7a08e36c80ebbd792c67ab361b	httpd-2.4.20.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index e752fcc..6d9a324 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.18
+APACHE_VERSION = 2.4.20
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
