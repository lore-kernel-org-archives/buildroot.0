From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Oct 2009 21:41:11 +0100
Subject: [Buildroot] [git commit master] lzma: bump version
Message-ID: <20091026204434.07021777B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=90be4efb3826d9a68336c147be81bdf8cad05fcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lzma/lzma.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index a5fae5b..c4a735d 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -3,7 +3,7 @@
 # lzma
 #
 #############################################################
-LZMA_VERSION:=4.32.6
+LZMA_VERSION:=4.32.7
 LZMA_SOURCE:=lzma-$(LZMA_VERSION).tar.gz
 LZMA_SITE:=http://tukaani.org/lzma/
 LZMA_INSTALL_STAGING = YES
-- 
1.6.3.3
