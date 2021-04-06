From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 11:27:52 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-tornado:
 add CPE variables
Message-ID: <20210406090708.1F96482A9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afbc828ac4d50b7275bd4a343f5d2718098f3d6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:tornadoweb:tornado is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atornadoweb%3Atornado

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f07f208e14763505ea71318385584b2755ac42d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-tornado/python-tornado.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 15f3b83689..c05a7d65d3 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -9,6 +9,8 @@ PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
 PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/95/84/119a46d494f008969bf0c775cb2c6b3579d3c4cc1bb1b41a022aa93ee242
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
+PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
+PYTHON_TORNADO_CPE_ID_PRODUCT = tornado
 PYTHON_TORNADO_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
