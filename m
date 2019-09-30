From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:35 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-cached-property: bump to
 version 1.5.1
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-9-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-cached-property/python-cached-property.hash | 7 ++++---
 package/python-cached-property/python-cached-property.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-cached-property/python-cached-property.hash b/package/python-cached-property/python-cached-property.hash
index 255b2d9ec6..cfe34ca1df 100644
--- a/package/python-cached-property/python-cached-property.hash
+++ b/package/python-cached-property/python-cached-property.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/cached-property/json, sha256 locally computed
-md5	fc7a49d2c4b7987f92b00c7b49128530  cached-property-1.4.0.tar.gz
-sha256	a2fa0f89dd422f7e5dd992a4a3e0ce209d5d1e47a4db28fd0a7b5273ec8da3f0  cached-property-1.4.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/cached-property/json
+md5	4b6f3cd429da5f487f4ebf3242bb991f  cached-property-1.5.1.tar.gz
+sha256	9217a59f14a5682da7c4b8829deadbfc194ac22e9908ccf7c8820234e80a1504  cached-property-1.5.1.tar.gz
+# Locally computed sha256 checksums
 sha256	ba4756c8039b25b66e3c456cc5bf635aa528cf459b97ee1499d06684ccd89b9a  LICENSE
diff --git a/package/python-cached-property/python-cached-property.mk b/package/python-cached-property/python-cached-property.mk
index 3e1363853f..f83a1f18f4 100644
--- a/package/python-cached-property/python-cached-property.mk
+++ b/package/python-cached-property/python-cached-property.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHED_PROPERTY_VERSION = 1.4.0
+PYTHON_CACHED_PROPERTY_VERSION = 1.5.1
 PYTHON_CACHED_PROPERTY_SOURCE = cached-property-$(PYTHON_CACHED_PROPERTY_VERSION).tar.gz
-PYTHON_CACHED_PROPERTY_SITE = https://pypi.python.org/packages/ce/87/72b7a5a0504ad8d5d5ea6804ac5b24ce4f07869f61c47ea00cd4382320ba
+PYTHON_CACHED_PROPERTY_SITE = https://files.pythonhosted.org/packages/57/8e/0698e10350a57d46b3bcfe8eff1d4181642fd1724073336079cb13c5cf7f
 PYTHON_CACHED_PROPERTY_SETUP_TYPE = setuptools
 PYTHON_CACHED_PROPERTY_LICENSE = BSD-3-Clause
 PYTHON_CACHED_PROPERTY_LICENSE_FILES = LICENSE
-- 
2.20.1
