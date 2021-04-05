From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 09:25:52 +0200
Subject: [Buildroot] [git commit] package/python-parso: add CPE variables
Message-ID: <20210405070517.49E8C8C581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=821ba90f164c3f7d4314935b2b683b23fffbace2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:parso_project:parso is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aparso_project%3Aparso

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-parso/python-parso.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-parso/python-parso.mk b/package/python-parso/python-parso.mk
index a0b6af8732..b7688c2069 100644
--- a/package/python-parso/python-parso.mk
+++ b/package/python-parso/python-parso.mk
@@ -10,5 +10,7 @@ PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/fe/24/c30eb4be8a24b9
 PYTHON_PARSO_SETUP_TYPE = setuptools
 PYTHON_PARSO_LICENSE = MIT, Python-2.0, BSD-3-Clause (flask theme)
 PYTHON_PARSO_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE test/normalizer_issue_files/LICENSE
+PYTHON_PARSO_CPE_ID_VENDOR = parso_project
+PYTHON_PARSO_CPE_ID_PRODUCT = parso
 
 $(eval $(python-package))
