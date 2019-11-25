From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 18:19:59 +0100
Subject: [Buildroot] [git commit] package/pkg-generic: fix space formatting
Message-ID: <20191202083935.478C68147C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ddaa31befb3fd8978f5be2933481a2f639377f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes a formatting issues where spaces were used instead of tabs.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 893faba22a..2b9440eb68 100644
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
