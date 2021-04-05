From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 09:30:14 +0200
Subject: [Buildroot] [git commit] package/python-enum34: add CPE variables
Message-ID: <20210405070517.AF5908C581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9496ed58bc291019492f6501c37065d494bdcb6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:python:enum34 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Aenum34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-enum34/python-enum34.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
index 3d3ce38830..0bd00508aa 100644
--- a/package/python-enum34/python-enum34.mk
+++ b/package/python-enum34/python-enum34.mk
@@ -10,6 +10,8 @@ PYTHON_ENUM34_SITE = https://files.pythonhosted.org/packages/11/c4/2da1f4952ba47
 PYTHON_ENUM34_SETUP_TYPE = setuptools
 PYTHON_ENUM34_LICENSE = BSD-3-Clause
 PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE
+PYTHON_ENUM34_CPE_ID_VENDOR = python
+PYTHON_ENUM34_CPE_ID_PRODUCT = enum34
 
 $(eval $(python-package))
 $(eval $(host-python-package))
