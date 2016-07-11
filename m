From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 11 Jul 2016 09:54:34 +0200
Subject: [Buildroot] [PATCH 1/4] python-dataproperty: bump to version 0.7.1
Message-ID: <1468223677-20192-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index dd1b84c..916352e 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/dataproperty/json
-md5	b0dfde2908e26585db24ef51d2153ca5  DataProperty-0.3.1.tar.gz
+md5	7ad4dabb5469bb3f150dd1018680119c  DataProperty-0.7.1.tar.gz
 # sha256 calculated by scanpypi
-sha256	12a5e97a7fba5a938ecadf24f8e9c0ed4f3fd045b84ec107d5fa5ce15c03f9ad  DataProperty-0.3.1.tar.gz
+sha256	2d53019e6ca7b95511ec733ea57dc108d916d2dd0818d88d1b7c0e06854a2d2e  DataProperty-0.7.1.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 06b8caf..927fa69 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.3.1
+PYTHON_DATAPROPERTY_VERSION = 0.7.1
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/94/84/a78a208b4fe3001e8fa1dc553122e3f27a807f26fee097f20714d6def70b
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/1f/64/b17e5ab3935484869cc3e8ec06ede0c94a296b4955c947d1dfe4460955f9
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.8.1
