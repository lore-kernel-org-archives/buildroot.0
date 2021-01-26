From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:21:10 +0100
Subject: [Buildroot] [git commit] package/gerbera: needs xpath in pugixml
Message-ID: <20210126180946.BD3168167F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7414ab12e57d67aee94a66913eabc88b2e3dd71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/0fcd0ce167c04f788bf1b9414ae5e7677691c7cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gerbera/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 5025b3753f..a07bcc5c57 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_GERBERA
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBUPNP if !BR2_PACKAGE_LIBNPUPNP
 	select BR2_PACKAGE_PUGIXML
+	select BR2_PACKAGE_PUGIXML_XPATH_SUPPORT
 	select BR2_PACKAGE_SPDLOG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
