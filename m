From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:23:13 +0200
Subject: [Buildroot] [git commit] package/python3-decorator: add
 _CPE_ID_VENDOR and _CPE_ID_PRODUCT
Message-ID: <20210420205903.850B0812AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b154320f0c5d83da0f6afff66995c5b97dd4c11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:python:decorator:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:python:decorator

Note: 4783e5fd8c already added those for the python(2) variant.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - add reference to 4783e5fd8c
  - move up, right after license
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python3-decorator/python3-decorator.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python3-decorator/python3-decorator.mk b/package/python3-decorator/python3-decorator.mk
index c14f10fbf4..ed6d86fe3a 100644
--- a/package/python3-decorator/python3-decorator.mk
+++ b/package/python3-decorator/python3-decorator.mk
@@ -10,6 +10,8 @@ PYTHON3_DECORATOR_SITE = https://files.pythonhosted.org/packages/dc/c3/9d378af09
 PYTHON3_DECORATOR_SOURCE = decorator-$(PYTHON3_DECORATOR_VERSION).tar.gz
 PYTHON3_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON3_DECORATOR_LICENSE_FILES = LICENSE.txt
+PYTHON3_DECORATOR_CPE_ID_VENDOR = python
+PYTHON3_DECORATOR_CPE_ID_PRODUCT = decorator
 PYTHON3_DECORATOR_SETUP_TYPE = setuptools
 HOST_PYTHON3_DECORATOR_NEEDS_HOST_PYTHON = python3
 
