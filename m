From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 13:00:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-docker: add CPE variables
Message-ID: <20210405110036.3567642-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:docker:docker-py is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adocker%3Adocker-py

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-docker/python-docker.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index 67cb150b48..f476a1badd 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -10,5 +10,7 @@ PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/de/54/a822d7116ff2f
 PYTHON_DOCKER_SETUP_TYPE = setuptools
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
+PYTHON_DOCKER_CPE_ID_VENDOR = docker
+PYTHON_DOCKER_CPE_ID_PRODUCT = docker-py
 
 $(eval $(python-package))
-- 
2.30.2
