From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:23 +0200
Subject: [Buildroot] [PATCH 35/36] package/qemu: move sub-options into a
	sub-menu
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-35-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As there are now quite a few options to QEMU, move them into their own
sub-menu, so it looks a bit less crowded in the 'misc' menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 89b37af..e51b045 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_QEMU
+menuconfig BR2_PACKAGE_QEMU
 	bool "QEMU"
 	depends on BR2_PACKAGE_PYTHON       # We only need host-python,
 	                                    # but there's no way to say so.
-- 
1.7.2.5
