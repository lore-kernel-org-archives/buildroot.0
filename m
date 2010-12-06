From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 Dec 2010 23:24:15 +0100
Subject: [Buildroot] [git commit master 1/1] xz: version bump to 5.0.0
Message-ID: <20101206222758.E97DD8D9B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7bb7de971269c863e7d5204417dd6adcc73e72c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    2 +-
 package/xz/xz.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index e590289..7ca867f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2011.02, Not yet released:
 
-	Updated/fixed packages: cloop, m4
+	Updated/fixed packages: cloop, m4, xz
 
 2010.11, Released November 30th, 2010:
 
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 7490f77..a965d8a 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -3,7 +3,7 @@
 # xz-utils
 #
 #############################################################
-XZ_VERSION = 4.999.9beta
+XZ_VERSION = 5.0.0
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
-- 
1.7.2.2
