From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 12:01:51 +0200
Subject: [Buildroot] [git commit] fping: bump to version 3.12
Message-ID: <20151016111136.7DB4D7FBFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66bff1be05f5b47cb2c6edd6fcd357328b116a89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes regression with fping6 -R.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fping/fping.hash |    2 +-
 package/fping/fping.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
index c52e145..99c01cf 100644
--- a/package/fping/fping.hash
+++ b/package/fping/fping.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d824a4a8be88f74efe17ed66147b1e75c36ff83442e847ab1d5cfa7d9548c507	fping-3.11.tar.gz
+sha256	d86f2281bda4653c7049e6ba8fce24ba67edbf9193b7bb1cf6219b0c8ddce4e6	fping-3.12.tar.gz
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index b33fa4d..c576dd1 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 3.11
+FPING_VERSION = 3.12
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
