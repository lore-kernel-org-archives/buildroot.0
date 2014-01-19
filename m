From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2014 23:30:42 +0100
Subject: [Buildroot] [PATCH] legacy: move 2014.02 header
Message-ID: <1390170642-32585-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Legacy LIBNFC_LLCP belongs to the 2014.02 cycle.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in.legacy | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 597534e..2fed2d8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -99,6 +99,8 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2014.02"
+
 config BR2_PACKAGE_LIBNFC_LLCP
 	bool "libnfc-llcp has been removed"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
@@ -109,9 +111,6 @@ config BR2_PACKAGE_LIBNFC_LLCP
           to 'libllcp'. We have added a new package for 'libllcp' and bumped
           the version at the same time.
 
-###############################################################################
-comment "Legacy options removed in 2014.02"
-
 config BR2_PACKAGE_SQUASHFS3
 	bool "squashfs3 has been removed"
 	select BR2_LEGACY
-- 
1.8.1.2
