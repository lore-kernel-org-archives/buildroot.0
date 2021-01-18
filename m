From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 18 Jan 2021 22:26:58 +0100
Subject: [Buildroot] [PATCH v1 1/3] package/pkg-cmake.mk: fix indent
Message-ID: <20210118212700.2316-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
 
-- 
2.29.2
