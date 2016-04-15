From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:43:14 +0200
Subject: [Buildroot] [git commit] cannelloni: bump to version 20160414
Message-ID: <20160415074319.393B3807BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6c40619006e78db7bd6ac10660f17803b2f1352
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5e9/5e9b44435522a26ad080b7810536686cc1e47c0f/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cannelloni/cannelloni.hash | 2 +-
 package/cannelloni/cannelloni.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index 826af9b..c14dceb 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  7341b76e2af056ecbcfc9fabc6e67c88234666be60f1eb099390c61bb9925856  cannelloni-v0.5.tar.gz
+sha256  fe5abb1c9e523049c48dd906603bc762cc55ccd20c16dbec7dc64163b9eefccf  cannelloni-20160414.tar.gz
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index efbe43d..680e09a 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CANNELLONI_VERSION = v0.5
+CANNELLONI_VERSION = 20160414
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPLv2
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt
