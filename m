From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:44 -0000
Subject: [Buildroot] [git commit] package/minizip: bump version to 1.1
Message-ID: <20170902130616.AFD67818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89db39c2344f23b93ce9bc7cf97b826ab5adf7bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 994ed60..718026c 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ac361f40531d9fb7222d4befd10d160c647d5e85138f6bc9eda080ed8f937fb8 minizip-5f56dd81d94bd7028f7dc05d7d14112697c30241.tar.gz
+sha256 5666b5ee3e85dfd2dd119970613c12e6267d31813f07d3ffa5d359fe272cb6d1  minizip-1.1.tar.gz
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 835dfb9..bcd6cc9 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 5f56dd81d94bd7028f7dc05d7d14112697c30241
+MINIZIP_VERSION = 1.1
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = zlib
 MINIZIP_AUTORECONF = YES
