From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 18:46:24 +0100
Subject: [Buildroot] [git commit] libssh2: bump to version 1.6.0
Message-ID: <20160108175325.E0A3F7FE2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18df1fd08813093402daf854dfbb9219d762efbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index bf040a8..51dcf0e 100644
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
