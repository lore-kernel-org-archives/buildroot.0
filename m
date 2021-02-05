From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Feb 2021 22:42:23 +0100
Subject: [Buildroot] [git commit] package/python-bottle: add CPE variables
Message-ID: <20210205212202.855737FC16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55565f18e1e876f3565d96c5d1371c99463eb2b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:bottlepy:bottle is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abottlepy%3Abottle

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bottle/python-bottle.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 18f1507a97..d19a439f8c 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -9,6 +9,8 @@ PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
 PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/ea/80/3d2dca1562ffa1929017c74635b4cb3645a352588de89e90d0bb53af3317
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
+PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
+PYTHON_BOTTLE_CPE_ID_PRODUCT = bottle
 PYTHON_BOTTLE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
