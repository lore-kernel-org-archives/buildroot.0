From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 23:59:51 +0100
Subject: [Buildroot] [git commit] luvi: bump to version 2.6.1
Message-ID: <20160308225957.A0E45802CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65095cea34c2fac01863a36949243b817ff836a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luvi/luvi.hash | 2 +-
 package/luvi/luvi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 325c84f..6f95dac 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  883fca4d50c18dc5b248144a00526b718e7c4c91841123b4a0732fef2b8791f4  luvi-src-v2.5.1.tar.gz
+sha256  a8b4aecf4c1d781614fe187b6afcb2dc7462fcd6e76a3f38cbfd0a8244c01582  luvi-src-v2.6.1.tar.gz
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index d83933e..305ff4f 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.5.1
+LUVI_VERSION = v2.6.1
 LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
