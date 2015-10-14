From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Oct 2015 14:06:37 -0300
Subject: [Buildroot] [PATCH] fping: bump to version 3.11
Message-ID: <1444842397-6344-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fping/fping.hash | 2 +-
 package/fping/fping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
index 65e25c7..c52e145 100644
--- a/package/fping/fping.hash
+++ b/package/fping/fping.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	cd47e842f32fe6aa72369d8a0e3545f7c137bb019e66f47379dc70febad357d8	fping-3.10.tar.gz
+sha256	d824a4a8be88f74efe17ed66147b1e75c36ff83442e847ab1d5cfa7d9548c507	fping-3.11.tar.gz
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index 0045bef..b33fa4d 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 3.10
+FPING_VERSION = 3.11
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
-- 
2.4.9
