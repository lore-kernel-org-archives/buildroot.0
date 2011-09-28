From: Will Newton <will.newton@gmail.com>
Date: Wed, 28 Sep 2011 15:29:55 +0100
Subject: [Buildroot] [PATCH] dmalloc: Fix install path for headers and info
	files.
Message-ID: <CAFbHwiTEqX1MbtADiOYvcJe7NfLv4H1-m_OdDcLFK7q+79LPCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/dmalloc/dmalloc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index dca0488..a4c8f83 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -37,7 +37,7 @@ define DMALLOC_INSTALL_STAGING_CMDS
 		bindir="$(STAGING_DIR)/usr/bin" \
 		libdir="$(STAGING_DIR)/usr/lib" \
 		shlibdir="$(STAGING_DIR)/usr/lib" \
-		includedir="$(STAGING_DIR)/usr/share/info/" \
+		infodir="$(STAGING_DIR)/usr/share/info/" \
 		-C $(@D) install
 endef

-- 
1.7.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-dmalloc-Fix-install-path-for-headers-and-info-files.patch
Type: text/x-diff
Size: 837 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110928/27f71aad/attachment.bin>
