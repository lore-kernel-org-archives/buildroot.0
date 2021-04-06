From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:43:56 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-flask: add
 CPE variables
Message-ID: <20210406072100.3A96C8BE9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bec9a2290cfbd88d8995de0affcfc9098a0a102
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:palletsprojects:flask is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apalletsprojects%3Aflask

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 21fecfab172ebee36e72baad874fe7a464806f94)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-flask/python-flask.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index cc39bf7e49..077aa600b8 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -10,5 +10,7 @@ PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4e/0b/cb02268c90e675
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
+PYTHON_FLASK_CPE_ID_VENDOR = palletsprojects
+PYTHON_FLASK_CPE_ID_PRODUCT = flask
 
 $(eval $(python-package))
