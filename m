From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Oct 2014 19:37:10 +0200
Subject: [Buildroot] [git commit] libmicrohttpd: bump to version 0.9.38
Message-ID: <20141008180329.F13DEB1427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eba33396d37e1c0b72a15dc0e4a7348ad760a5bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.hash |    2 ++
 package/libmicrohttpd/libmicrohttpd.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
new file mode 100644
index 0000000..8cc7d59
--- /dev/null
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	8df2b4dd863c98799a4775a530d905363fbc02fec850af9094da890b28b9e721	libmicrohttpd-0.9.38.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index e7a8e6e..80dcfa0 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.37
+LIBMICROHTTPD_VERSION = 0.9.38
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
