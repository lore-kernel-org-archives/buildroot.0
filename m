From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 21:42:54 +0100
Subject: [Buildroot] [git commit] openntpd: bump to version 5.7p2
Message-ID: <20150123204619.5171F80E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1126176be64c2e71f190e43b31247d33a351fdc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openntpd/openntpd.hash |    4 ++--
 package/openntpd/openntpd.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openntpd/openntpd.hash b/package/openntpd/openntpd.hash
index a7007ed..f906dad 100644
--- a/package/openntpd/openntpd.hash
+++ b/package/openntpd/openntpd.hash
@@ -1,2 +1,2 @@
-# From http://www.openntpd.org/txt/release-5.7p1.txt
-sha256	071cfdcfc179c481568a2b8262945243a3123abfc7fa8831da1bbff3729b8307	openntpd-5.7p1.tar.gz
+# From ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/SHA256
+sha256	1640ad4a6e6475f6065d5f999b17b5dc6ab40dc17309b782b9ae390fe54bd6a5	openntpd-5.7p2.tar.gz
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 158ac85..abc75ae 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENNTPD_VERSION = 5.7p1
+OPENNTPD_VERSION = 5.7p2
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = COPYING
