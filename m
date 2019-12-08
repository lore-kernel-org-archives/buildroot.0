From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2019 08:39:58 +0100
Subject: [Buildroot] [git commit] package/wine: bump to version 4.0.3
Message-ID: <20191208073535.019708871F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f8709980123053dad84e462ba2bd719ac1be8e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 4162ef97ac..eeb30c9a9f 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 994050692f8417ee206daafa5fc0ff810cc9392ffda1786ac0f0fb0cf74dbd74 wine-4.0.2.tar.xz
+sha256 25026d9f98a5d62583b8a02c91b1adaca9a2ff000d54095bb274045379e00fda wine-4.0.3.tar.xz
 # Locally calculated
 sha256 e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c COPYING.LIB
 sha256 d29132813288a9b6034a79c53b22dbb1b078c70cec5c9bb731ae574cf812aa54 LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 623db47c6e..f315d90994 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 4.0.2
+WINE_VERSION = 4.0.3
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/4.0
 WINE_LICENSE = LGPL-2.1+
