From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:35 +0200
Subject: [Buildroot] [PATCH 15/28] package/python-json-schema-validator:
	bump version to 2.4.1
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-15-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../python-json-schema-validator/python-json-schema-validator.hash   | 5 +++--
 package/python-json-schema-validator/python-json-schema-validator.mk | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-json-schema-validator/python-json-schema-validator.hash b/package/python-json-schema-validator/python-json-schema-validator.hash
index 96f5d89..7360aba 100644
--- a/package/python-json-schema-validator/python-json-schema-validator.hash
+++ b/package/python-json-schema-validator/python-json-schema-validator.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  316befb9a6d981dff465f5243e423a3027b27775f7649510ce23fde300dde9b7  json-schema-validator-2.3.tar.gz
+# md5 from https://pypi.python.org/pypi/json-schema-validator/json, sha256 locally computed
+md5	7691b41739faaa8b0965279e72889932  json-schema-validator-2.4.1.tar.gz
+sha256	1562a21d83e56231cef09b9aa2c06e8f845974bd26f24be293de6cab9a2fac91  json-schema-validator-2.4.1.tar.gz
diff --git a/package/python-json-schema-validator/python-json-schema-validator.mk b/package/python-json-schema-validator/python-json-schema-validator.mk
index 0ff5554..1456c34 100644
--- a/package/python-json-schema-validator/python-json-schema-validator.mk
+++ b/package/python-json-schema-validator/python-json-schema-validator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSON_SCHEMA_VALIDATOR_VERSION = 2.3
+PYTHON_JSON_SCHEMA_VALIDATOR_VERSION = 2.4.1
 PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE = json-schema-validator-$(PYTHON_JSON_SCHEMA_VALIDATOR_VERSION).tar.gz
-PYTHON_JSON_SCHEMA_VALIDATOR_SITE = http://pypi.python.org/packages/source/j/json-schema-validator
+PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://pypi.python.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
 PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPLv3
 PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = python-versiontools
-- 
2.9.3
