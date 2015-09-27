From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Sep 2015 13:34:50 +0200
Subject: [Buildroot] [PATCH] core/pkg-generic: use tabs, not spaces
Message-ID: <1443353690-7302-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6a7d97e..5201fca 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -661,11 +661,11 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
-$$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
+$$($(2)_TARGET_INSTALL_HOST):		PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
-$$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
-$$($(2)_TARGET_RSYNC):                  PKG=$(2)
+$$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
+$$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
-- 
1.9.1
