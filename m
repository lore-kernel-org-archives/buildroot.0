From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:37:52 +0100
Subject: [Buildroot] [git commit] package/python-pyyaml: add CPE variables
Message-ID: <20210302201930.34FE881E4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40fa7a825d72b200e0afe8b16be4793140114944
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pyyaml:pyyaml is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apyyaml%3Apyyaml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyyaml/python-pyyaml.mk   | 2 ++
 package/python3-pyyaml/python3-pyyaml.mk | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 7bbae309c6..c2d0435275 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -11,6 +11,8 @@ PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/64/c2/b80047c7ac247
 PYTHON_PYYAML_SETUP_TYPE = distutils
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
+PYTHON_PYYAML_CPE_ID_VENDOR = pyyaml
+PYTHON_PYYAML_CPE_ID_PRODUCT = pyyaml
 PYTHON_PYYAML_DEPENDENCIES = libyaml
 HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
 
diff --git a/package/python3-pyyaml/python3-pyyaml.mk b/package/python3-pyyaml/python3-pyyaml.mk
index c0dcebf4fc..1b467645aa 100644
--- a/package/python3-pyyaml/python3-pyyaml.mk
+++ b/package/python3-pyyaml/python3-pyyaml.mk
@@ -11,6 +11,8 @@ PYTHON3_PYYAML_SITE = https://files.pythonhosted.org/packages/64/c2/b80047c7ac24
 PYTHON3_PYYAML_SETUP_TYPE = distutils
 PYTHON3_PYYAML_LICENSE = MIT
 PYTHON3_PYYAML_LICENSE_FILES = LICENSE
+PYTHON3_PYYAML_CPE_ID_VENDOR = pyyaml
+PYTHON3_PYYAML_CPE_ID_PRODUCT = pyyaml
 HOST_PYTHON3_PYYAML_DL_SUBDIR = python-pyyaml
 HOST_PYTHON3_PYYAML_NEEDS_HOST_PYTHON = python3
 HOST_PYTHON3_PYYAML_DEPENDENCIES = host-libyaml
