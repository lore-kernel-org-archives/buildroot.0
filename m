From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:45:23 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-pyjwt: add
 CPE variables
Message-ID: <20210406072100.ADDC38BE9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7700ae5fbd8d5fcd022534b4e7b2c928084dab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:pyjwt_project:pyjwt is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apyjwt_project%3Apyjwt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 536a5017f7d17317473ef203326178ba90ce4e42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyjwt/python-pyjwt.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 9215911389..942499ea49 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -10,5 +10,7 @@ PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/14/6d/096dc269d105ba
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
+PYTHON_PYJWT_CPE_ID_VENDOR = pyjwt_project
+PYTHON_PYJWT_CPE_ID_PRODUCT = pyjwt
 
 $(eval $(python-package))
