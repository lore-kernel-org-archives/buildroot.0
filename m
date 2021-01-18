From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:32:40 +0100
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: fix indent
Message-ID: <20210118211406.652EF8841B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=281f07b71be75032ce6affc47d5d636952043ae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 3ee7067250..c001051002 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -58,7 +58,7 @@ $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
 $(2)_INSTALL_OPTS		?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
-$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install/fast
+$(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
 
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
