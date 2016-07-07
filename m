From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 11:48:49 +0200
Subject: [Buildroot] [git commit] package/apache: security bump to version
	2.4.23
Message-ID: <20160707094913.4BFF380450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d72868f1583cb745a875f1eae263c24e085ce592
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2016-4979:
TLS/SSL X.509 client certificate auth bypass with HTTP/2
http://httpd.apache.org/security/vulnerabilities_24.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 062a549..e4710b0 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.20.tar.bz2.sha1
-sha1	cefe8ea4a3f81c7a08e36c80ebbd792c67ab361b	httpd-2.4.20.tar.bz2
+# From http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2.sha1
+sha1	5101be34ac4a509b245adb70a56690a84fcc4e7f	httpd-2.4.23.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 6d9a324..e78545a 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.20
+APACHE_VERSION = 2.4.23
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
