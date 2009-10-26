From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Oct 2009 08:31:34 +0100
Subject: [Buildroot] [git commit master] libelf: bump version
Message-ID: <20091026073314.D5F3E77705@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a1d2d172ec225a5ff2379c691d0944b1cca82baf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libelf/libelf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index ade369e..2a7d066 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -3,7 +3,7 @@
 # libelf
 #
 #############################################################
-LIBELF_VERSION=0.8.10
+LIBELF_VERSION=0.8.12
 LIBELF_SOURCE=libelf-$(LIBELF_VERSION).tar.gz
 LIBELF_SITE=http://www.mr511.de/software/
 LIBELF_INSTALL_STAGING = YES
-- 
1.6.3.3
