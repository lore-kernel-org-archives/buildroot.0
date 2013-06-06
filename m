From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 11:47:17 -0500
Subject: [Buildroot] [PATCH 02/14] libcofi: fix github tarball to use commit
	id
In-Reply-To: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370537249-15682-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libcofi/libcofi.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcofi/libcofi.mk b/package/libcofi/libcofi.mk
index e2ce702..7c0bc06 100644
--- a/package/libcofi/libcofi.mk
+++ b/package/libcofi/libcofi.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
-LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/master
+LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/$(LIBCOFI_VERSION)
 LIBCOFI_LICENSE = LGPLv2.1
 LIBCOFI_LICENSE_FILES = README.md
 
-- 
1.7.9.5
