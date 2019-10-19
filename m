From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 19 Oct 2019 20:26:03 +0200
Subject: [Buildroot] [git commit] package/python-jinja2: bump to version
 2.10.3
Message-ID: <20191019182739.44A7182866@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e46b564d4600090e2d840f7a981995af3267a305
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Fix indentation in hash file.
* LICENSE was renamed to LICENSE.rst.
  In addition, some phrasing and formatting were slightly changed
  (commit 65da441ee72ffd270e7ce4e4ab60a8826567078b on upstream).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-jinja2/python-jinja2.hash | 6 +++---
 package/python-jinja2/python-jinja2.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 21a9c8394f..7231123b58 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5 0ae535be40fd215a8114a090c8b68e5a Jinja2-2.10.1.tar.gz
-sha256 065c4f02ebe7f7cf559e49ee5a95fb800a9e4528727aec6f24402a5374c65013 Jinja2-2.10.1.tar.gz
+md5	7883559bc5cc3e2781d94b4be61cfdcd  Jinja2-2.10.3.tar.gz
+sha256	9fe95f19286cfefaa917656583d020be14e7859c6b0252588391e47db34527de  Jinja2-2.10.3.tar.gz
 # Locally computed sha256
-sha256 26fcd436fdc8a39d44896ac03e6f1dfd25e38499c48f20d8bc1dd3bf0aaa8a5b LICENSE
+sha256	3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 339ddd7e18..5f011aa1ab 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 2.10.1
+PYTHON_JINJA2_VERSION = 2.10.3
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/93/ea/d884a06f8c7f9b7afbc8138b762e80479fb17aedbbe2b06515a12de9378d
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/7b/db/1d037ccd626d05a7a47a1b81ea73775614af83c2b3e53d86a0bb41d8d799
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
-PYTHON_JINJA2_LICENSE_FILES = LICENSE
+PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
 
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
