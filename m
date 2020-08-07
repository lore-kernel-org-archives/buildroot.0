From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  7 Aug 2020 19:11:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.46
Message-ID: <20200807171100.220432-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://archive.apache.org/dist/httpd/CHANGES_2.4.46

Release notes: https://downloads.apache.org/httpd/Announcement2.4.html

Fixes CVE-2020-9490, CVE-2020-11984 & CVE-2020-11993:
https://httpd.apache.org/security/vulnerabilities_24.html

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.hash | 10 ++++++++--
 package/apache/apache.mk   |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 7b0e4ad8e7..4fe457d701 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,4 +1,10 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.43.tar.bz2.sha256
-sha256  a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43  httpd-2.4.43.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.md5
+md5  7d661ea5e736dac5e2761d9f49fe8361  httpd-2.4.46.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.sha1
+sha1  1b7cd10ff3a2a07a576d77e34f0204d95fa4aceb  httpd-2.4.46.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.sha256
+sha256  740eddf6e1c641992b22359cabc66e6325868c3c5e2e3f98faf349b61ecf41ea  httpd-2.4.46.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.sha512
+sha512  5936784bb662e9d8a4f7fe38b70c043b468114d931cd10ea831bfe74461ea5856b64f88f42c567ab791fc8907640a99884ba4b6a600f86d661781812735b6f13  httpd-2.4.46.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 068f36e325..203d637fbb 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.43
+APACHE_VERSION = 2.4.46
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.27.0
