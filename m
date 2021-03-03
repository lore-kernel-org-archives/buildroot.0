From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:39:38 +0100
Subject: [Buildroot] [git commit] package/mpg123: add MPG123_CPE_ID_VENDOR
Message-ID: <20210303122740.75681815EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70c0ebf2936ffc28ab31b8ce3889a89727e60b5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:mpg123:mpg123 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ampg123%3Ampg123

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 5e3b7fd94e..588a4ffc32 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -11,6 +11,7 @@ MPG123_CONF_OPTS = --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPL-2.1
 MPG123_LICENSE_FILES = COPYING
+MPG123_CPE_ID_VENDOR = mpg123
 MPG123_DEPENDENCIES = host-pkgconf
 
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
