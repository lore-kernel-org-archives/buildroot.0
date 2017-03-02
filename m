From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-enum34: bump to version 1.1.6
Message-ID: <20170302205923.3FEFE82298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=276940a19ad6c40d6b82baa80ce1cabef0cc2f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-enum34/python-enum34.hash | 6 +++---
 package/python-enum34/python-enum34.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-enum34/python-enum34.hash b/package/python-enum34/python-enum34.hash
index dd6ce34..a5f0c65 100644
--- a/package/python-enum34/python-enum34.hash
+++ b/package/python-enum34/python-enum34.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=ac80f432ac9373e7d162834b264034b6, sha256 locally computed
-md5	ac80f432ac9373e7d162834b264034b6  enum34-1.0.4.tar.gz
-sha256	d3c19f26a6a34629c18c775f59dfc5dd595764c722b57a2da56ebfb69b94e447  enum34-1.0.4.tar.gz
+# md5 from https://pypi.python.org/pypi/enum34/json, sha256 locally computed
+md5 5f13a0841a61f7fc295c514490d120d0 enum34-1.1.6.tar.gz
+sha256 8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1 enum34-1.1.6.tar.gz
diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
index 13c529d..9b7fbd4 100644
--- a/package/python-enum34/python-enum34.mk
+++ b/package/python-enum34/python-enum34.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENUM34_VERSION = 1.0.4
+PYTHON_ENUM34_VERSION = 1.1.6
 PYTHON_ENUM34_SOURCE = enum34-$(PYTHON_ENUM34_VERSION).tar.gz
-PYTHON_ENUM34_SITE = http://pypi.python.org/packages/source/e/enum34
+PYTHON_ENUM34_SITE = https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876
 PYTHON_ENUM34_SETUP_TYPE = distutils
 PYTHON_ENUM34_LICENSE = BSD-3c
 PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE
