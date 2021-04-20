From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:23:13 +0200
Subject: [Buildroot] [git commit] package/python3-setuptools: add
 _CPE_ID_VENDOR and_CPE_ID_PRODUCT
Message-ID: <20210420205903.91AC2815BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c819d208349d90bd7cbe70bf2f50a9cd0b7c78f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:python:setuptools:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:python:setuptools

Note: 63332c33aa already added those for the python(2) variant.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - add reference to 63332c33aa
  - move up, right after license
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python3-setuptools/python3-setuptools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index 3f4f1100fe..34d5993120 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -11,6 +11,8 @@ PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
 PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
+PYTHON3_SETUPTOOLS_CPE_ID_VENDOR = python
+PYTHON3_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
 PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
 HOST_PYTHON3_SETUPTOOLS_DL_SUBDIR = python-setuptools
 HOST_PYTHON3_SETUPTOOLS_NEEDS_HOST_PYTHON = python3
