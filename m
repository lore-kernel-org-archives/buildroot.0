From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:27:19 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-engineio:
 add PYTHON_ENGINEIO_CPE_ID_VENDOR
Message-ID: <20210517210058.AC8FC86BD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd647bfb8d254aa7e143466a1e9ee3a2864cd450
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:python-engineio_project:python-engineio is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython-engineio_project%3Apython-engineio

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 901689bfcc66af407b533515ec9623082383dc59)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-engineio/python-engineio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index d0e073fa95..4f835da0a4 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -9,6 +9,7 @@ PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/71/5d/620b75396ce
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
+PYTHON_ENGINEIO_CPE_ID_VENDOR = python-engineio_project
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 # only needed/valid for python 3.x
