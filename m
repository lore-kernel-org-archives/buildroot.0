From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 22:12:10 +0100
Subject: [Buildroot] [git commit] libnl: bump to version 3.2.27
Message-ID: <20151025213049.14BEB818D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77a30a05caf9b07e5e9b6bf797f270e576940388
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnl/libnl.hash |    4 ++--
 package/libnl/libnl.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 9ce5ffe..2f1a3cb 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,2 +1,2 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_2_26/libnl-3.2.26.tar.gz.sha256sum
-sha256	1323ff6cea47efe9f988893b09840942a8c36131f472a9f3b96eb68d8f8d7555	libnl-3.2.26.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_2_27/libnl-3.2.27.tar.gz.sha256sum
+sha256	4bbbf92b3c78a90f423cf96260bf419a28b75db8cced47051217a56795f58ec6	libnl-3.2.27.tar.gz
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 5993e97..85c0db8 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.2.26
+LIBNL_VERSION = 3.2.27
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
