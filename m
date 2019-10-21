From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:46:09 +0200
Subject: [Buildroot] [git commit] package/python{3}-setuptools: bump to
 version 41.4.0
Message-ID: <20191021194016.5F0138395E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9eeca607ba2cc34bb287e292cfc626ce909eea88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 package/python3-setuptools/python3-setuptools.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 1baccf309d..cc4a831d2e 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  6404ca798bb9a9073aff3b91b2df35c8  setuptools-41.0.1.zip
-sha256  a222d126f5471598053c9a77f4b5d4f26eaa1f150ad6e01dcf1a42e185d05613  setuptools-41.0.1.zip
+md5  89a592d733b31e180a4b6ad760c0685a  setuptools-41.4.0.zip
+sha256  7eae782ccf36b790c21bde7d86a4f303a441cd77036b25c559a602cf5186ce4d  setuptools-41.4.0.zip
 sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 8a0717a61f..163ba869ca 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python3-setuptools/python3-setuptools.mk
-PYTHON_SETUPTOOLS_VERSION = 41.0.1
+PYTHON_SETUPTOOLS_VERSION = 41.4.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/f4/d5/a6c19dcbcbc267aca376558797f036d9bcdff344c9f785fe7d0fe9a5f2a7
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index 55be0a3141..078cd9b072 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 41.0.1
+PYTHON3_SETUPTOOLS_VERSION = 41.4.0
 PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/f4/d5/a6c19dcbcbc267aca376558797f036d9bcdff344c9f785fe7d0fe9a5f2a7
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
