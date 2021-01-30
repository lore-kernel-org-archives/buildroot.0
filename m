From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 13:29:19 +0100
Subject: [Buildroot] [git commit] package/sox: add CPE variables
Message-ID: <20210130121305.401E280432@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=048dac075891bf8b939445fe6a7367acad5153fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:sound_exchange_project:sound_exchange is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asound_exchange_project%3Asound_exchange

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sox/sox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 013ccbbcf4..9abbc2f636 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -10,6 +10,8 @@ SOX_SOURCE = sox-$(SOX_VERSION).tar.bz2
 SOX_DEPENDENCIES = host-pkgconf
 SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
+SOX_CPE_ID_VENDOR = sound_exchange_project
+SOX_CPE_ID_PRODUCT = sound_exchange
 
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
