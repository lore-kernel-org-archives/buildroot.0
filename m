From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 17:09:59 +0100
Subject: [Buildroot] [git commit] libssh2: security bump to version 1.5.0
Message-ID: <20150311161052.468AB81777@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0df6ad5ddb5036dcc7400d79e83a803e1cac9908
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2015-1782 - kex: bail out on rubbish in the incoming packet.

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh2/libssh2.hash |    2 ++
 package/libssh2/libssh2.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
new file mode 100644
index 0000000..ccc6ed5
--- /dev/null
+++ b/package/libssh2/libssh2.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	83196badd6868f5b926bdac8017a6f90fb8a90b16652d3bf02df0330d573d0fc	libssh2-1.5.0.tar.gz
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 1a1a06f..3b4df37 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1.4.3
+LIBSSH2_VERSION = 1.5.0
 LIBSSH2_SITE = http://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
