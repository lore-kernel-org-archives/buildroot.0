From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:22:54 +0100
Subject: [Buildroot] [git commit] util-linux: put package options in a
	sub-menu
Message-ID: <20160119202351.7F710827CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ade93c30d3cb3c349772a1957786a2bb0fa8672
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hide all the util-linux options in a menuconfig, as the option
list is quite long.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 214b975..df89f99 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_UTIL_LINUX
+menuconfig BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
