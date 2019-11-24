From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 25 Nov 2019 00:09:18 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic: fix space formatting
Message-ID: <20191124230918.30221-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes a formatting issues where spaces were used instead of tabs.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d7a678412e..88dca2c498 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -684,10 +684,10 @@ $(2)_INSTALL_TARGET		?= YES
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
-$(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
+$(2)_TARGET_INSTALL_HOST =	$$($(2)_DIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
-$(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
+$(2)_TARGET_RSYNC =		$$($(2)_DIR)/.stamp_rsynced
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
-- 
2.17.1
