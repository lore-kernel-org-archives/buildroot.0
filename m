From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Mar 2020 16:20:18 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-enum34: bump to version
 1.1.10
Message-ID: <20200326222018.45925-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-enum34/python-enum34.hash | 4 ++--
 package/python-enum34/python-enum34.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-enum34/python-enum34.hash b/package/python-enum34/python-enum34.hash
index 7c0746f80b..e43e00a5fe 100644
--- a/package/python-enum34/python-enum34.hash
+++ b/package/python-enum34/python-enum34.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/enum34/json
-md5 5f13a0841a61f7fc295c514490d120d0 enum34-1.1.6.tar.gz
+md5  b5ac0bb5ea9e830029599e410d09d3b5  enum34-1.1.10.tar.gz
 # Locally computed
-sha256  8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1  enum34-1.1.6.tar.gz
+sha256  cce6a7477ed816bd2542d03d53db9f0db935dd013b70f336a95c73979289f248  enum34-1.1.10.tar.gz
 sha256  88ec6a6c8eafa3b9757e745783938bef3f5e4d5e3c76b1db576aa3ab520e5e1d  enum/LICENSE
diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
index 09d1143ab9..3d3ce38830 100644
--- a/package/python-enum34/python-enum34.mk
+++ b/package/python-enum34/python-enum34.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENUM34_VERSION = 1.1.6
+PYTHON_ENUM34_VERSION = 1.1.10
 PYTHON_ENUM34_SOURCE = enum34-$(PYTHON_ENUM34_VERSION).tar.gz
-PYTHON_ENUM34_SITE = https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876
+PYTHON_ENUM34_SITE = https://files.pythonhosted.org/packages/11/c4/2da1f4952ba476677a42f25cd32ab8aaf0e1c0d0e00b89822b835c7e654c
 PYTHON_ENUM34_SETUP_TYPE = setuptools
 PYTHON_ENUM34_LICENSE = BSD-3-Clause
 PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE
-- 
2.20.1
