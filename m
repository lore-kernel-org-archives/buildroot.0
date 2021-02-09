From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Feb 2021 22:28:27 +0100
Subject: [Buildroot] [git commit] package/attr: set ATTR_CPE_ID_VALID
Message-ID: <20210209211311.B4DC58131F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2b532af15e2417fb434521a1c7b61f4c0d19c08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:attr_project:attr is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aattr_project%3Aattr

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/attr/attr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index ba77e802d2..13f3f0db3d 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -8,6 +8,7 @@ ATTR_VERSION = 2.4.48
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
+ATTR_CPE_ID_VALID = YES
 
 ATTR_INSTALL_STAGING = YES
 
