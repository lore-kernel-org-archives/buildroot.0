From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:30:26 +0200
Subject: [Buildroot] [git commit] package/python-pip: add CPE variables
Message-ID: <20210406071627.CD0DA8D3FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c845523fe24dfc8d9a00603c54e36fdb0d580696
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pypa:pip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apypa%3Apip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pip/python-pip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index cc40eecdfe..f881a3ce55 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -10,5 +10,7 @@ PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc7181723
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
+PYTHON_PIP_CPE_ID_VENDOR = pypa
+PYTHON_PIP_CPE_ID_PRODUCT = pip
 
 $(eval $(python-package))
