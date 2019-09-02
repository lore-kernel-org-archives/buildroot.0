From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 14:41:38 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/apache: security
 bump to version 2.4.41
Message-ID: <20190902123750.505A4890D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ad24b7f7cc5a8396bd1cb0d9a5e55bc77b79515
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Release notes:
http://www.apache.org/dist/httpd/Announcement2.4.html
http://www.apache.org/dist/httpd/CHANGES_2.4.41

Fixes
CVE-2019-10081
CVE-2019-9517
CVE-2019-10098
CVE-2019-10092
CVE-2019-10097
CVE-2019-10082

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2b702f73dfd25073c131edd504530aac4c2787d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 0c3a1d5303..24c00eb94c 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,4 +1,4 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.39.tar.bz2.sha256
-sha256 b4ca9d05773aa59b54d66cd8f4744b945289f084d3be17d7981d1783a5decfa2 httpd-2.4.39.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.41.tar.bz2.sha256
+sha256 133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40 httpd-2.4.41.tar.bz2
 # Locally computed
 sha256 c49c0819a726b70142621715dae3159c47b0349c2bc9db079070f28dadac0229 LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index ebb28b653a..1d62538b19 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.39
+APACHE_VERSION = 2.4.41
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
