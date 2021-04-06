From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 11:27:22 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-jinja2:
 add CPE variables
Message-ID: <20210406090708.0802C82A9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17fba31c4c416caa731de1cd5adb0b3001a823b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:pocoo:jinja2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apocoo%3Ajinja2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 165f60a09237359611fd11a6ba63abe812e37128)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jinja2/python-jinja2.mk   | 2 ++
 package/python3-jinja2/python3-jinja2.mk | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 51b484d03e..9b59d2b019 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -11,6 +11,8 @@ PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
+PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
+PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
 
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
diff --git a/package/python3-jinja2/python3-jinja2.mk b/package/python3-jinja2/python3-jinja2.mk
index cc8b1ff86f..851ee28b59 100644
--- a/package/python3-jinja2/python3-jinja2.mk
+++ b/package/python3-jinja2/python3-jinja2.mk
@@ -10,6 +10,8 @@ PYTHON3_JINJA2_SITE = https://files.pythonhosted.org/packages/64/a7/45e11eebf2f1
 PYTHON3_JINJA2_SETUP_TYPE = setuptools
 PYTHON3_JINJA2_LICENSE = BSD-3-Clause
 PYTHON3_JINJA2_LICENSE_FILES = LICENSE.rst
+PYTHON3_JINJA2_CPE_ID_VENDOR = pocoo
+PYTHON3_JINJA2_CPE_ID_PRODUCT = jinja2
 
 HOST_PYTHON3_JINJA2_NEEDS_HOST_PYTHON = python3
 # In host build, setup.py tries to download markupsafe if it is not installed
