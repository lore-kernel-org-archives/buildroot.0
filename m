From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:41 -0500
Subject: [Buildroot] [PATCH 20/25] package/python3-decorator: add
 _CPE_ID_VENDOR and _CPE_ID_PRODUCT
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-20-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:python:decorator:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:python:decorator

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/python3-decorator/python3-decorator.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python3-decorator/python3-decorator.mk b/package/python3-decorator/python3-decorator.mk
index c14f10fbf4..e6f940a95c 100644
--- a/package/python3-decorator/python3-decorator.mk
+++ b/package/python3-decorator/python3-decorator.mk
@@ -11,6 +11,8 @@ PYTHON3_DECORATOR_SOURCE = decorator-$(PYTHON3_DECORATOR_VERSION).tar.gz
 PYTHON3_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON3_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON3_DECORATOR_SETUP_TYPE = setuptools
+PYTHON3_DECORATOR_CPE_ID_VENDOR = python
+PYTHON3_DECORATOR_CPE_ID_PRODUCT = decorator
 HOST_PYTHON3_DECORATOR_NEEDS_HOST_PYTHON = python3
 
 $(eval $(host-python-package))
-- 
2.17.1
