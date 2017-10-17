From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 22:25:01 +0200
Subject: [Buildroot] [git commit] logrotate: bump version to 3.13.0
Message-ID: <20171017201739.5A1EB8112C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e492cbbd9f6803a3f9cbc93aa0465919ed399f73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 860263c..70b068c 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 683ccb7fff74082471aa6bd9e962ae7a3f4d55eea7df41fd97aa12ec6f55e657  logrotate-3.12.3.tar.gz
+sha256 fb1ff8502e7ae4aedaa3d0da8d3740a6a0f44b72e34666af724e9094b166c942  logrotate-3.13.0.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 274b2b6..c2c4885 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.12.3
+LOGROTATE_VERSION = 3.13.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
