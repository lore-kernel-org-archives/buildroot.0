From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:49:19 +0100
Subject: [Buildroot] [git commit] package/quickjs: bump to version 2020-11-08
Message-ID: <20201205203346.D10277FBAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1682b083e627c8b82b5d0260323521b3f196dae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 076e4bddbb..5dbd4575f0 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0021a3e8cdc6b61e225411d05e2841d2437e1ccf4b4cabb9a5f7685ebfb57717  quickjs-2020-09-06.tar.xz
+sha256  2e9d63dab390a95ed365238f21d8e9069187f7ed195782027f0ab311bb64187b  quickjs-2020-11-08.tar.xz
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 557ffb196d..1a2e63278f 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2020-09-06
+QUICKJS_VERSION = 2020-11-08
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
