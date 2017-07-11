From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 21:31:17 +0200
Subject: [Buildroot] [git commit] package/apache: bump version to 2.4.27
Message-ID: <20170711193642.895C080DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf9b7cedac14de7cf5650589bf4c37635b5438a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Announcement: http://www.apache.org/dist/httpd/Announcement2.4.html
Release notes: http://www.apache.org/dist/httpd/CHANGES_2.4.27

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index fe7174a..f29ae45 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.26.tar.bz2.sha256
-sha256 a07eb52fafc879e0149d31882f7da63173e72df4478db4dc69f7a775b663d387 httpd-2.4.26.tar.bz2
+# From http://www.apache.org/dist/httpd/httpd-2.4.27.tar.bz2.sha256
+sha256 71fcc128238a690515bd8174d5330a5309161ef314a326ae45c7c15ed139c13a httpd-2.4.27.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index b276b8d..857e538 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.26
+APACHE_VERSION = 2.4.27
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
