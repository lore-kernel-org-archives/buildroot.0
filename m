From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2015 15:29:40 +0200
Subject: [Buildroot] [git commit] libtasn1: bump to version 4.5
Message-ID: <20150430133027.C6C4D7FD9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a3e74cf5af734649852a218ec548d48cffa5d2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtasn1/libtasn1.hash |    2 +-
 package/libtasn1/libtasn1.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index 05a8633..653e018 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	f8349db1b4fe634105c77e11d26b2173e587827e86e1a489b5e38ffa822e0c5d	libtasn1-4.4.tar.gz
+sha256	89b3b5dce119273431544ecb305081f3530911001bb12e5d76588907edb71bda	libtasn1-4.5.tar.gz
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 0ec74e8..eeff76c 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.4
+LIBTASN1_VERSION = 4.5
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
