From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Jan 2016 17:33:20 -0300
Subject: [Buildroot] [PATCH] libssh2: bump to version 1.6.0
Message-ID: <1452198800-19387-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libssh2/libssh2.hash | 2 +-
 package/libssh2/libssh2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index ccc6ed5..3bf7562 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	83196badd6868f5b926bdac8017a6f90fb8a90b16652d3bf02df0330d573d0fc	libssh2-1.5.0.tar.gz
+sha256	5a202943a34a1d82a1c31f74094f2453c207bf9936093867f41414968c8e8215	libssh2-1.6.0.tar.gz
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index dab2c6e..597c336 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1.5.0
+LIBSSH2_VERSION = 1.6.0
 LIBSSH2_SITE = http://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
-- 
2.4.10
