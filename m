From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jun 2016 21:13:15 +0200
Subject: [Buildroot] [git commit] libarchive: security bump to version 3.2.1
Message-ID: <20160623191636.2BDC9802A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25d5aebead19d555cd73bcfa96b43d597ba40f6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-4302 - Libarchive Rar RestartModel Code Execution Vulnerability
CVE-2016-4300 - Libarchive 7zip read_SubStreamsInfo Code Execution
Vulnerability
CVE-2016-4809 - Memory allocate error in corrupted cpio archives

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 6a782c6..2c39bd3 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  7bce45fd71ff01dc20d19edd78322d4965583d81b8bed8e26cacb65d6f5baa87  libarchive-3.2.0.tar.gz
+sha256  72ee1a4e3fd534525f13a0ba1aa7b05b203d186e0c6072a8a4738649d0b3cfd2  libarchive-3.2.1.tar.gz
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 0e1e517..6e9c0a1 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.2.0
+LIBARCHIVE_VERSION = 3.2.1
 LIBARCHIVE_SITE = http://www.libarchive.org/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
