From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:35:52 +0200
Subject: [Buildroot] [git commit] package/gmrender-resurrect: bump version
Message-ID: <20160605200530.2C6F77FB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed1c47bcc6cb97b017d59d14602c1288a9ce95fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gmrender-resurrect/gmrender-resurrect.hash | 2 +-
 package/gmrender-resurrect/gmrender-resurrect.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
index f41447a..ba4561e 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.hash
+++ b/package/gmrender-resurrect/gmrender-resurrect.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 502129ecb097bf23ba011f18a8bf1923951ec2dc6da157f3b376383c5f99b623 gmrender-resurrect-aa3d02cf40321cf78a6ea9019e23a7f6cd091dee.tar.gz
+sha256 8cd9eae3e6be75684c9b7c4d29702fcbbeead0ded1d4f7cf8fb65fe1dc718596 gmrender-resurrect-48caaa4f6c386fd1586126c801cd326f96d5fa5c.tar.gz
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
index 18c6e01..24608a1 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.mk
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMRENDER_RESURRECT_VERSION = aa3d02cf40321cf78a6ea9019e23a7f6cd091dee
+GMRENDER_RESURRECT_VERSION = 48caaa4f6c386fd1586126c801cd326f96d5fa5c
 GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,$(GMRENDER_RESURRECT_VERSION))
 # Original distribution does not have default configure,
 # so we need to autoreconf:
