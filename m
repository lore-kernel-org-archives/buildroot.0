From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 14:00:26 +0100
Subject: [Buildroot] [git commit] package/libyaml: add LIBYAML_CPE_ID_VENDOR
Message-ID: <20210305123920.3FC0F812C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bea3d1f6578f13ea4a97bd25631932e8e74a2ce4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pyyaml:libyaml is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apyyaml%3Alibyaml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libyaml/libyaml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index f65317aab7..cf3d44cac3 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -10,6 +10,7 @@ LIBYAML_SITE = http://pyyaml.org/download/libyaml
 LIBYAML_INSTALL_STAGING = YES
 LIBYAML_LICENSE = MIT
 LIBYAML_LICENSE_FILES = License
+LIBYAML_CPE_ID_VENDOR = pyyaml
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
