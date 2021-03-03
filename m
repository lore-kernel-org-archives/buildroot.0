From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:41:52 +0100
Subject: [Buildroot] [git commit] package/pango: add PANGO_CPE_ID_VENDOR
Message-ID: <20210303122740.C530E844EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e44dcbd953cbc9cfcacc89fcad9483b5a3afed07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pango:pango is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apango%3Apango

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pango/pango.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index d719b76594..803e46f193 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -11,6 +11,7 @@ PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
+PANGO_CPE_ID_VENDOR = pango
 
 PANGO_CONF_OPTS = -Duse_fontconfig=true
 HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=disabled
