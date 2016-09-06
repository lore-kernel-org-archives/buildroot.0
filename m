From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Sep 2016 21:30:55 +0200
Subject: [Buildroot] [git commit] ncmpc: bump to version 0.25
Message-ID: <20160906193115.A81458222A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09def84be82a00ea47a638fb9cd71acf1d1ec82c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The download has a .sig file so use it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncmpc/ncmpc.hash | 4 ++--
 package/ncmpc/ncmpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index 1acc64d..e7646b2 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,2 +1,2 @@
-# Calculated locally
-sha256 0e6f76b2b11449cfa479d2830ac681f4e3bff54a95a9134b069dd5a173b4c3e9 ncmpc-0.24.tar.xz
+# Locally calculated after checking pgp signature
+sha256 6e328acb71d06ae9e6c5fced99bc28ae78bcab1a73130b42ce9ab08a814ecea4 ncmpc-0.25.tar.xz
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 050b6b8..b5fa7cd 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).24
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).25
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
