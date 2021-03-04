From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 19:53:41 +0100
Subject: [Buildroot] [git commit] package/heimdal: set HEIMDAL_CPE_ID_VALID
Message-ID: <20210304183428.C56A181370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5aa8448ed1fd910bcf1c9ac1e399e6ec8c630609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:heimdal_project:heimdal is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aheimdal_project%3Aheimdal

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/heimdal/heimdal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 5c0570fdd1..b72778f396 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -31,6 +31,7 @@ HOST_HEIMDAL_CONF_OPTS = \
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
 HEIMDAL_LICENSE = BSD-3-Clause
 HEIMDAL_LICENSE_FILES = LICENSE
+HEIMDAL_CPE_ID_VALID = YES
 
 # We need asn1_compile in the PATH for samba4
 define HOST_HEIMDAL_MAKE_SYMLINK
