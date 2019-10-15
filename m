From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Oct 2019 11:20:41 +0200
Subject: [Buildroot] [git commit] package/haveged: bump to version 1.9.8
Message-ID: <20191015091537.D5A888E19D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c87ae6c296e2fa925de3506640a7fd673f093446
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index fc7858787d..2bb1fdd846 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4d4c046755476d3734ffb78772c242c25913ff0eb7509c143671dae6ec9d1189	haveged-1.9.6.tar.gz
+sha256  99aa1996c6e39ea2459cfc37addfb8b1eecc63f3a2b6da9db17b22e76b6851ae	haveged-1.9.8.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index afb54df1ad..05b59a1685 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.6
+HAVEGED_VERSION = 1.9.8
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
