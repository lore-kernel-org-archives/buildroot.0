From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:45:46 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-ecdsa: add
 PYTHON_ECDSA_CPE_ID_VENDOR
Message-ID: <20210406072100.C781A8BE9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccbe5cb339200b0eb8657ab4555795b6311a8930
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:python-ecdsa_project:python-ecdsa is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython-ecdsa_project%3Apython-ecdsa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c0747ee4f483121bf0657ccbf4e8ed1b659ddd6d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ecdsa/python-ecdsa.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index ffb51a3aa5..1178c378fb 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -10,5 +10,6 @@ PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/e3/7c/b508ade1feb47c
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
+PYTHON_ECDSA_CPE_ID_VENDOR = python-ecdsa_project
 
 $(eval $(python-package))
