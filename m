From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2021 16:36:37 +0100
Subject: [Buildroot] [git commit] package/privoxy: add PRIVOXY_CPE_ID_VENDOR
Message-ID: <20210202152051.273E1864D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b1d9675ba4c25eb4606986bf7b72fd9221529f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:privoxy:privoxy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aprivoxy%3Aprivoxy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/privoxy/privoxy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index 5c1f862bfd..7f0e5bb3a1 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -12,5 +12,6 @@ PRIVOXY_AUTORECONF = YES
 PRIVOXY_DEPENDENCIES = pcre zlib
 PRIVOXY_LICENSE = GPL-2.0+
 PRIVOXY_LICENSE_FILES = LICENSE
+PRIVOXY_CPE_ID_VENDOR = privoxy
 
 $(eval $(autotools-package))
