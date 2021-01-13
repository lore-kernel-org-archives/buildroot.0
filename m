From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2021 10:34:50 +0100
Subject: [Buildroot] [git commit] package/ncmpc: bump to version 0.42
Message-ID: <20210113091841.08130876AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f3191b9fa721afd86f0c54abcd88ca40c734a1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncmpc/ncmpc.hash | 2 +-
 package/ncmpc/ncmpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index a95358ec5f..3215b35b1b 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  64ebe320c2fbe4dfbff4461ceae730001841d06d48c4882d69f320912a0f11a8  ncmpc-0.39.tar.xz
+sha256  a5f7471d766a71c222374efa4aa17ef6ee0e42ad48d15528edd935d1f0f6cd4d  ncmpc-0.42.tar.xz
 
 # Hash for license file:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 1742ad20fa..ddeccf7f69 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).39
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).42
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
