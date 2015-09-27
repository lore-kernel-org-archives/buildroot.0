From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 19:35:13 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: use tabs, not spaces
Message-ID: <20150927173518.8676880DF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9940a83d7de6f88aaf83f83a4f6edde78f6c8b21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
