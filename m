From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:15:42 +0200
Subject: [Buildroot] [git commit] package/python-jinja2: add CPE variables
Message-ID: <20210405160039.333557FC58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=165f60a09237359611fd11a6ba63abe812e37128
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pocoo:jinja2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apocoo%3Ajinja2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jinja2/python-jinja2.mk   | 2 ++
 package/python3-jinja2/python3-jinja2.mk | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index b0dcd89dbd..f91cac6937 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -11,6 +11,8 @@ PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
+PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
+PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
 
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
diff --git a/package/python3-jinja2/python3-jinja2.mk b/package/python3-jinja2/python3-jinja2.mk
index 188dda91b7..5d29e1d889 100644
--- a/package/python3-jinja2/python3-jinja2.mk
+++ b/package/python3-jinja2/python3-jinja2.mk
@@ -10,6 +10,8 @@ PYTHON3_JINJA2_SITE = https://files.pythonhosted.org/packages/4f/e7/65300e6b32e6
 PYTHON3_JINJA2_SETUP_TYPE = setuptools
 PYTHON3_JINJA2_LICENSE = BSD-3-Clause
 PYTHON3_JINJA2_LICENSE_FILES = LICENSE.rst
+PYTHON3_JINJA2_CPE_ID_VENDOR = pocoo
+PYTHON3_JINJA2_CPE_ID_PRODUCT = jinja2
 
 HOST_PYTHON3_JINJA2_NEEDS_HOST_PYTHON = python3
 # In host build, setup.py tries to download markupsafe if it is not installed
