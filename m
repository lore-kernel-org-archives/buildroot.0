From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 17:36:35 +0100
Subject: [Buildroot] [git commit] libssh2: security bump to version 1.7.0
Message-ID: <20160224163805.269D080462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=229ea8a18cf0f57e24fb13783a2fdf2e3ae7af13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-0787 - diffie_hellman_sha256: convert bytes to bits.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh2/libssh2.hash | 2 +-
 package/libssh2/libssh2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index 3bf7562..8f6268f 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5a202943a34a1d82a1c31f74094f2453c207bf9936093867f41414968c8e8215	libssh2-1.6.0.tar.gz
+sha256	e4561fd43a50539a8c2ceb37841691baf03ecb7daf043766da1b112e4280d584	libssh2-1.7.0.tar.gz
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 51dcf0e..221fac4 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1.6.0
+LIBSSH2_VERSION = 1.7.0
 LIBSSH2_SITE = http://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
