From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 23:40:24 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mpv: add
 MPV_CPE_ID_VENDOR
Message-ID: <20210607211334.E140B8004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ef158c3db8a2f023354613248e862c483c4a715
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:mpv:mpv is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ampv%3Ampv

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b5eaff4df313f95ecfd2f2287a8fc5cf37024dad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/mpv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 18f307d186..ca3b8c878a 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -11,6 +11,7 @@ MPV_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 MPV_LICENSE = GPL-2.0+
 MPV_LICENSE_FILES = LICENSE.GPL
+MPV_CPE_ID_VENDOR = mpv
 
 MPV_NEEDS_EXTERNAL_WAF = YES
 
