From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 10:09:30 +0100
Subject: [Buildroot] [git commit] package/python-decorator: bump to version
 4.4.1
Message-ID: <20191102090554.04A558E519@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f798df973eab29f0d5faba109d0831b4cb19d11d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-decorator/python-decorator.hash | 6 +++---
 package/python-decorator/python-decorator.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
index 98587519d5..77b48d84cd 100644
--- a/package/python-decorator/python-decorator.hash
+++ b/package/python-decorator/python-decorator.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/decorator/json, sha256 locally calculated
-md5	a565a98581c0d110bc247323e89df9b1 decorator-4.4.0.tar.gz
-sha256	86156361c50488b84a3f148056ea716ca587df2f0de1d34750d35c21312725de decorator-4.4.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/decorator/json
+md5	933981f288c4230816b5beee8d40e6ea decorator-4.4.1.tar.gz
+sha256	54c38050039232e1db4ad7375cfce6748d7b41c29e95a081c8a6d2c30364a2ce decorator-4.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256	fd11660cabf0532082c45706862fafc294907ec7f8e217818240a4999806782e  LICENSE.txt
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index 0179b91769..8df1dd70c9 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DECORATOR_VERSION = 4.4.0
-PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/ba/19/1119fe7b1e49b9c8a9f154c930060f37074ea2e8f9f6558efc2eeaa417a2
+PYTHON_DECORATOR_VERSION = 4.4.1
+PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/dc/c3/9d378af09f5737cfd524b844cd2fbb0d2263a35c11d712043daab290144d
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
