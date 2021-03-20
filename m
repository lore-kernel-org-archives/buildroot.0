From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 20:09:20 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/libnet: add
 LIBNET_CPE_ID_VENDOR
Message-ID: <20210320185734.959DC865AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54bc59387553436e9682db299aac04f591a9f25b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:libnet_project:libnet is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibnet_project%3Alibnet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 135bae2163c96a3d5d1c419ad737b1b5ae93f61f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnet/libnet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index 966106837a..5c5071b9c3 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -11,5 +11,6 @@ LIBNET_INSTALL_STAGING = YES
 LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
 LIBNET_LICENSE = BSD-2-Clause, BSD-3-Clause
 LIBNET_LICENSE_FILES = doc/COPYING
+LIBNET_CPE_ID_VENDOR = libnet_project
 
 $(eval $(autotools-package))
