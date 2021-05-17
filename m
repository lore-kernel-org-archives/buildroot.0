From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:27:12 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-keyring:
 add CPE variables
Message-ID: <20210517210058.9F1A487C0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56b1f4b885f62ebefffae6888dd765c2f397e6eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:python:keyring is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Akeyring

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 14614d63f7ebc766cf276ae3dc44ef50a16d5562)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-keyring/python-keyring.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 2f6ee8497f..0e05738605 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -10,6 +10,8 @@ PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/ee/46/77fdb7cd2b0f
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
+PYTHON_KEYRING_CPE_ID_VENDOR = python
+PYTHON_KEYRING_CPE_ID_PRODUCT = keyring
 PYTHON_KEYRING_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
