From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 11:28:01 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-networkx:
 add CPE variables
Message-ID: <20210406090708.296FF82A9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5ba82a9e40fb316ae9c8bc44eef29726cc2767f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:python:networkx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Anetworkx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1175f4604486d4db2bfd1f45369fc0c65804f5ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-networkx/python-networkx.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 2efc53d628..8ebbc84bde 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -9,6 +9,8 @@ PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
 PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/bf/63/7b579dd3b1c49ce6b7fd8f6f864038f255201410905dd183cf7f4a3845cf
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
+PYTHON_NETWORKX_CPE_ID_VENDOR = python
+PYTHON_NETWORKX_CPE_ID_PRODUCT = networkx
 PYTHON_NETWORKX_SETUP_TYPE = setuptools
 HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python3-decorator
 HOST_PYTHON_NETWORKX_NEEDS_HOST_PYTHON = python3
