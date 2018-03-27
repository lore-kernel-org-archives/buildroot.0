From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Mar 2018 09:49:30 +0200
Subject: [Buildroot] [git commit] modem-manager: remove wrong gnutls
 dependency comment
Message-ID: <20180327075508.7ED6F81055@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4edbebed58db9ea88c2876d35f4c122e4c54ce0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modem-manager/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 8e995b4175..215449a50e 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MODEM_MANAGER
 	bool "modemmanager"
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_USE_WCHAR # libglib2 and gnutls
+	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS # runtime dependency
