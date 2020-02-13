From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 21:56:21 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version
 2.11.1
Message-ID: <20200213045621.115858-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jinja2/python-jinja2.hash | 4 ++--
 package/python-jinja2/python-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 7231123b58..e366b9e180 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5	7883559bc5cc3e2781d94b4be61cfdcd  Jinja2-2.10.3.tar.gz
-sha256	9fe95f19286cfefaa917656583d020be14e7859c6b0252588391e47db34527de  Jinja2-2.10.3.tar.gz
+md5	5d88c7e77aa63fc852a04f65dbfe5594  Jinja2-2.11.1.tar.gz
+sha256	93187ffbc7808079673ef52771baa950426fd664d3aad1d0fa3e95644360e250  Jinja2-2.11.1.tar.gz
 # Locally computed sha256
 sha256	3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 5f011aa1ab..189b75d18f 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 2.10.3
+PYTHON_JINJA2_VERSION = 2.11.1
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/7b/db/1d037ccd626d05a7a47a1b81ea73775614af83c2b3e53d86a0bb41d8d799
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/d8/03/e491f423379ea14bb3a02a5238507f7d446de639b623187bccc111fbecdf
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
-- 
2.20.1
