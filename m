From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:42:10 +0200
Subject: [Buildroot] [git commit] package/python-decorator: bump to version
 4.4.0
Message-ID: <20191008203844.2495C8B7E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd29dd6e6fb3a7e3ac2ba797e202be462c2d9472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license hash (copyright year bump).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-decorator/python-decorator.hash | 6 +++---
 package/python-decorator/python-decorator.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
index ca7fb88e7b..98587519d5 100644
--- a/package/python-decorator/python-decorator.hash
+++ b/package/python-decorator/python-decorator.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/decorator/json, sha256 locally calculated
-md5 73644c8f0bd4983d1b6a34b49adec0ae decorator-4.0.11.tar.gz
-sha256 953d6bf082b100f43229cf547f4f97f97e970f5ad645ee7601d55ff87afdfe76 decorator-4.0.11.tar.gz
+md5	a565a98581c0d110bc247323e89df9b1 decorator-4.4.0.tar.gz
+sha256	86156361c50488b84a3f148056ea716ca587df2f0de1d34750d35c21312725de decorator-4.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256 c9fbbd46d5af040b2b26db2f693034c95de8e9faaaf1cd68af358b092a56d454  LICENSE.txt
+sha256	fd11660cabf0532082c45706862fafc294907ec7f8e217818240a4999806782e  LICENSE.txt
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index 67d9b8e719..0179b91769 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DECORATOR_VERSION = 4.0.11
-PYTHON_DECORATOR_SITE = https://pypi.python.org/packages/cc/ac/5a16f1fc0506ff72fcc8fd4e858e3a1c231f224ab79bb7c4c9b2094cc570
+PYTHON_DECORATOR_VERSION = 4.4.0
+PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/ba/19/1119fe7b1e49b9c8a9f154c930060f37074ea2e8f9f6558efc2eeaa417a2
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
