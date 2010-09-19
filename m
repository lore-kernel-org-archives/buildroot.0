From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:28 -0700
Subject: [Buildroot] [PATCH 06/21] ccache: bump to 3.0.1
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-7-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 toolchain/ccache/ccache.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/ccache/ccache.mk b/toolchain/ccache/ccache.mk
index 8e414b2..01d18fb 100644
--- a/toolchain/ccache/ccache.mk
+++ b/toolchain/ccache/ccache.mk
@@ -3,7 +3,7 @@
 # build ccache to make recompiles faster on the build system
 #
 #############################################################
-CCACHE_VER:=2.4
+CCACHE_VER:=3.0.1
 CCACHE_SITE:=http://samba.org/ftp/ccache
 CCACHE_SOURCE:=ccache-$(CCACHE_VER).tar.gz
 CCACHE_DIR1:=$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)
-- 
1.7.2.3
