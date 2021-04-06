From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:44:57 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/python-cryptography: add CPE variables
Message-ID: <20210406072100.804658BE9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18ce3618f3775d68334eeb991e7b176ea0e8c686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:cryptography_project:cryptography is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acryptography_project%3Acryptography

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d2eaa6a81c00daa6d9f4c33c82a6763cc64c54f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cryptography/python-cryptography.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 6eb7be8d5d..bc7a9f8027 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -10,6 +10,8 @@ PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc87
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
+PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
+PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
 
 $(eval $(python-package))
