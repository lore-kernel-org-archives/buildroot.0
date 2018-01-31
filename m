From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:59:07 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] ccache: bump to version
 3.3.4
Message-ID: <20180131123645.C887A88170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8e24ab5e7eb1a2613c03260fa6b90839d581f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Switch download URL to avoid a redirect.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 64da2fd2594ac05f84ef04376745dff1d32a8f09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index bde53f794d..5354572638 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,2 @@
-# Verified key https://samba.org/ftp/ccache/ccache-3.3.3.tar.xz.asc - sha256 computed locally
-sha256  3b02a745da1cfa9eb438af7147e0fd3545e2f6163de9e5b07da86f58859f04ec  ccache-3.3.3.tar.xz
+# Verified key https://samba.org/ftp/ccache/ccache-3.3.4.tar.xz.asc - sha256 computed locally
+sha256  24f15bf389e38c41548c9c259532187774ec0cb9686c3497bbb75504c8dc404f  ccache-3.3.4.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 55a913259f..9b79014c5a 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.3.3
-CCACHE_SITE = https://samba.org/ftp/ccache
+CCACHE_VERSION = 3.3.4
+CCACHE_SITE = https://www.samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
 CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
