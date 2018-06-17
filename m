From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:45:03 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] network-manager: fix
 package prompt name
Message-ID: <20180617155627.822E5826A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b7282600fe96d5645381f995a254535db601823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Rename the prompt string for consistency with the package directory
name.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b5da9637ec97a8159d4d92b13ee392f9e656cd94)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 72658c1278..9602cc4a1a 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_NETWORK_MANAGER
-	bool "networkmanager"
+	bool "network-manager"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_MMU # dbus
