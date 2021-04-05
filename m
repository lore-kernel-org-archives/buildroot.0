From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:14:13 +0200
Subject: [Buildroot] [git commit] package/python-docker: add CPE variables
Message-ID: <20210405160039.194638D3CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66b7d2ce1c0a928b2ad37bc425a38f17e515109a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:docker:docker-py is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adocker%3Adocker-py

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
