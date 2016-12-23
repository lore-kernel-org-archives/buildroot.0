From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:56:37 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] package/apache: security
	bump version to 2.4.25
Message-ID: <20161223220932.A363D81EC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1bd3e4104cddf1940fe5523ffda86e2081e03fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Changelog:
http://www.apache.org/dist/httpd/CHANGES_2.4.25

Fixes CVE-2016-8740, CVE-2016-5387, CVE-2016-2161, CVE-2016-0736,
CVE-2016-8743.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 68af1dc2575888863ae0015b09555a5e42a5d56c)
---
 package/apache/apache.hash | 2 +-
 package/apache/apache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index e4710b0..38fd883 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
 # From http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2.sha1
-sha1	5101be34ac4a509b245adb70a56690a84fcc4e7f	httpd-2.4.23.tar.bz2
+sha1 bd6d138c31c109297da2346c6e7b93b9283993d2  httpd-2.4.25.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index e54b736..ae629bd 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.23
+APACHE_VERSION = 2.4.25
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
