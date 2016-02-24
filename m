From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Feb 2016 09:01:44 -0300
Subject: [Buildroot] [PATCH 2/2] libssh2: security bump to version 1.7.0
In-Reply-To: <1456315304-25601-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456315304-25601-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1456315304-25601-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-0787 - diffie_hellman_sha256: convert bytes to bits.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.4.10
