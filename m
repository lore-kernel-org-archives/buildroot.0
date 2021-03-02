From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 14:00:33 +0100
Subject: [Buildroot] [git commit] package/bubblewwrap: add
 BUBBLEWRAP_CPE_ID_VENDOR
Message-ID: <20210302123842.029FA83B6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b0a7c6a9177cf54c7b480048ca9c05e546b6c61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:projectatomic:bubblewrap is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aprojectatomic%3Abubblewrap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bubblewrap/bubblewrap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 388f64880e..18c175951a 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -11,6 +11,7 @@ BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
 
 BUBBLEWRAP_LICENSE = LGPL-2.0+
 BUBBLEWRAP_LICENSE_FILES = COPYING
+BUBBLEWRAP_CPE_ID_VENDOR = projectatomic
 
 BUBBLEWRAP_CONF_OPTS = \
 	--enable-require-userns=no \
