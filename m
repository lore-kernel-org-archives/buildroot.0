From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 16:10:35 +0200
Subject: [Buildroot] [git commit] package/libsoundtouch: bump to version
 2.1.2
Message-ID: <20200413190129.AC61C8EA45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2203d4df9aadf952a62962d5dae1856918b52c97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Updated download site and download method
- The hash of the license file is updated due to a newline change at
  the end of the file

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoundtouch/libsoundtouch.hash | 4 ++--
 package/libsoundtouch/libsoundtouch.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index a79e62f031..aa33bb8a7e 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c805e7a72b7758a8986b71e73d2f94a8c79c66c1246fa2af1743c4282702e096  libsoundtouch-010a91a59071c7fefd316fca62c0d980ec85b4b1.tar.gz
-sha256  9c6a15d7433078e4c0d3cb9820f172bbf0bf829e7648d719dc85c1429815519b  COPYING.TXT
+sha256  3a431facf019f37cc2da112156226d686e941b15d6327f3a41d7ca21dfaf8e94  libsoundtouch-2.1.2.tar.gz
+sha256  6b73f6327136a924821ec044bbd9f17cf8677faf2f2a2b1366a9fff6188c9688  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index fcc2332fad..9b040e391c 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 010a91a59071c7fefd316fca62c0d980ec85b4b1
-LIBSOUNDTOUCH_SITE = https://freeswitch.org/stash/scm/sd/libsoundtouch.git
-LIBSOUNDTOUCH_SITE_METHOD = git
+LIBSOUNDTOUCH_VERSION = 2.1.2
+LIBSOUNDTOUCH_SITE = https://gitlab.com/soundtouch/soundtouch/-/archive/$(LIBSOUNDTOUCH_VERSION)
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
 LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
 LIBSOUNDTOUCH_AUTORECONF = YES
