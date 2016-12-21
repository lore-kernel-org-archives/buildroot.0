From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 22:18:58 +0100
Subject: [Buildroot] [git commit] wine: Bump to version 1.8.6
Message-ID: <20161221211911.5BE9A802A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=460cbfe9777673df00221a0b335a5eefd18b2815
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 0f6b9d3..a5297f0 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 dee2a4959e5f90a89aaf04566c23f2926e9590f8968ea662afd81947fdb6f6d6 wine-1.8.5.tar.bz2
+sha256 b1797896eb3b63aab8a4753cc756d6211a0e85460146a1b52063ec79c13906d3 wine-1.8.6.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 47ba90a..1947daa 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 1.8.5
+WINE_VERSION = 1.8.6
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
 WINE_SITE = https://dl.winehq.org/wine/source/1.8
 WINE_LICENSE = LGPLv2.1+
