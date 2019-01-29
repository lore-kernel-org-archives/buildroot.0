From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 19:29:36 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/apache: bump
 version to 2.4.37
Message-ID: <20190129182856.03AE08227F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93aa26b79ea5be566a0f4cce86ba6fa15d619689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Changelog: http://www.apache.org/dist/httpd/CHANGES_2.4.37
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5f832bb812382bc45cfdcb411b57c5cc9cae56b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 2 +-
 package/apache/apache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 32743656fd..6d21f0f614 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,4 +1,4 @@
 # From http://archive.apache.org/dist/httpd/httpd-2.4.35.tar.bz2.sha256
-sha256 2607c6fdd4d12ac3f583127629291e9432b247b782396a563bec5678aae69b56 httpd-2.4.35.tar.bz2
+sha256 3498dc5c6772fac2eb7307dc7963122ffe243b5e806e0be4fb51974ff759d726 httpd-2.4.37.tar.bz2
 # Locally computed
 sha256 c49c0819a726b70142621715dae3159c47b0349c2bc9db079070f28dadac0229 LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 982c6de793..cd21c9ce5c 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.35
+APACHE_VERSION = 2.4.37
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
