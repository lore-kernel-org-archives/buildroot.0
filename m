From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:42 -0500
Subject: [Buildroot] [PATCH 21/25] package/python3-setuptools: add
 _CPE_ID_VENDOR and_CPE_ID_PRODUCT
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-21-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:python:setuptools:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:python:setuptools

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/python3-setuptools/python3-setuptools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index 3f4f1100fe..6baa11df44 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -12,6 +12,8 @@ PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
+PYTHON3_SETUPTOOLS_CPE_ID_VENDOR = python
+PYTHON3_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
 HOST_PYTHON3_SETUPTOOLS_DL_SUBDIR = python-setuptools
 HOST_PYTHON3_SETUPTOOLS_NEEDS_HOST_PYTHON = python3
 
-- 
2.17.1
