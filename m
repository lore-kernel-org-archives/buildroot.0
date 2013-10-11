From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2013 23:00:13 +0200
Subject: [Buildroot] [PATCH 3/3] weston: add help text for compositor
	backends
In-Reply-To: <1381525213-14034-1-git-send-email-arnout@mind.be>
References: <1381525213-14034-1-git-send-email-arnout@mind.be>
Message-ID: <1381525213-14034-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/weston/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index ea0e87e..4322aaa 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -42,8 +42,12 @@ config BR2_PACKAGE_WESTON_RPI
 	depends on BR2_TOOLCHAIN_HAS_THREADS    # rpi-userland
 	select BR2_PACKAGE_RPI_USERLAND
 	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
+	help
+	  Compositor backend for the Raspberry Pi.
 
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
+	help
+	  Compositor backend for the Linux framebuffer.
 
 endif
-- 
1.8.4.rc3
