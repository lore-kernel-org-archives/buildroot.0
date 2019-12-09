From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Dec 2019 21:52:23 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/libfribidi: enable host build
Message-ID: <20191209205224.2762-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libfribidi/libfribidi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 4394623592..0e17be6db0 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -13,3 +13,4 @@ LIBFRIBIDI_INSTALL_STAGING = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.24.0
