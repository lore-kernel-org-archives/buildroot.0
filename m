From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Apr 2021 14:52:12 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-markdown2:
 add PYTHON_MARKDOWN2_CPE_ID_VENDOR
Message-ID: <20210424124716.D2E92801D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd12eb931dc798469aef999a1a2402a4d97cea4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:python-markdown2_project:python-markdown2 is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython-markdown2_project%3Apython-markdown2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aaa96d78877ec9cef82d249d5f899b7c52d239a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-markdown2/python-markdown2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index c7858a3966..3ffa35796f 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -10,5 +10,6 @@ PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/14/69/c542025f80
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
+PYTHON_MARKDOWN2_CPE_ID_VENDOR = python-markdown2_project
 
 $(eval $(python-package))
