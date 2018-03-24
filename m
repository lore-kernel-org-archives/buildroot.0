From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 11:53:48 +0100
Subject: [Buildroot] [git commit] package/apache: security bump to version
 2.4.33
Message-ID: <20180324105507.9D79D81234@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65193bf3c93ec6922979907ce87fc82a73b25268
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: http://www.apache.org/dist/httpd/CHANGES_2.4.33

Fixes CVE-2017-15710, CVE-2018-1283, CVE-2018-1303, CVE-2018-1301,
CVE-2017-15715, CVE-2018-1312, CVE-2018-1302.

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 5 +++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 6471c38b62..76c7c766cb 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,3 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.29.tar.bz2.sha256
-sha256 777753a5a25568a2a27428b2214980564bc1c38c1abf9ccc7630b639991f7f00 httpd-2.4.29.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.33.tar.bz2.sha256
+sha256 de02511859b00d17845b9abdd1f975d5ccb5d0b280c567da5bf2ad4b70846f05 httpd-2.4.33.tar.bz2
+sha256 c49c0819a726b70142621715dae3159c47b0349c2bc9db079070f28dadac0229 LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index e1b1a209cb..eaf7b9c5bf 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.29
+APACHE_VERSION = 2.4.33
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
