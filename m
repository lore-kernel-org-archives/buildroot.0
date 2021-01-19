From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 15:55:42 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/pkg-cmake.mk: fix
 indent
Message-ID: <20210119144001.BBAB7883B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed81ce32e361f4355ad891f40c6acae76ca5ca2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 281f07b71be75032ce6affc47d5d636952043ae4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
