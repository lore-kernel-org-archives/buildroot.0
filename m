From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:16:08 +0200
Subject: [Buildroot] [git commit] package/python-pyro: add CPE variables
Message-ID: <20210405160039.4023A8D3CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fcc47d5ad1e54074721874f2540857fbca1a4db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pyro_project:pyro is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apyro_project%3Apyro

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyro/python-pyro.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
index 06b4f457f2..235575c195 100644
--- a/package/python-pyro/python-pyro.mk
+++ b/package/python-pyro/python-pyro.mk
@@ -9,6 +9,8 @@ PYTHON_PYRO_SOURCE = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
 PYTHON_PYRO_SITE = https://pypi.python.org/packages/61/68/0978adae315261b87acd216517c2c7f00780396e4d1426c5412458c6a28f
 PYTHON_PYRO_LICENSE = MIT
 PYTHON_PYRO_LICENSE_FILES = LICENSE
+PYTHON_PYRO_CPE_ID_VENDOR = pyro_project
+PYTHON_PYRO_CPE_ID_PRODUCT = pyro
 PYTHON_PYRO_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
