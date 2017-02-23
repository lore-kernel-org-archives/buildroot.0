From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:18:22 +0100
Subject: [Buildroot] [git commit] package/turbolua: bump version to v2.1.0
Message-ID: <20170301170423.C22AE7FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81ea69036e92825e6de633fd373f5963b0bd2f54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wojciech Nizinski <niziak@spox.org>
[Thomas: use the v2.1.0 tag rather than a full commit sha1.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/turbolua/turbolua.hash | 2 +-
 package/turbolua/turbolua.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index d460b4f..dc718f8 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 bff771b6a670f764366eff50e1644f1c5d8d526324e0b6adfda42d9f69791833 turbolua-6fbc5cbfed1cc8c3820d4c1bfb55258c764040f0.tar.gz
+sha256 8b810aa531fcaf05020531fe904d449742fd0da85c31e925a7efa9816d1f8f88 turbolua-v2.1.0.tar.gz
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index bf9e27f..49877fa 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TURBOLUA_VERSION = 6fbc5cbfed1cc8c3820d4c1bfb55258c764040f0
+TURBOLUA_VERSION = v2.1.0
 TURBOLUA_SITE = $(call github,kernelsauce,turbo,$(TURBOLUA_VERSION))
 TURBOLUA_DEPENDENCIES = luajit
 TURBOLUA_LICENSE = Apache-2.0
