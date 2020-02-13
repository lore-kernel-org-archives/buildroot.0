From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 22:33:04 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-pip: bump to version 20.0.2
Message-ID: <20200213053304.108218-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 7d02a51023..58bc239154 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5	1aaaf90fbafc50e7ba1e66ffceb00960  pip-19.3.1.tar.gz
-sha256	21207d76c1031e517668898a6b46a9fb1501c7a4710ef5dfd6a40ad9e6757ea7  pip-19.3.1.tar.gz
+md5	7d42ba49b809604f0df3d55df1c3fd86  pip-20.0.2.tar.gz
+sha256	7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967f  pip-20.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256	5ba21fbb0964f936ad7d15362d1ed6d4931cc8c8f9ff2d4d91190e109be74431  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index b8be234d24..cc40eecdfe 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 19.3.1
+PYTHON_PIP_VERSION = 20.0.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/ce/ea/9b445176a65ae4ba22dce1d93e4b5fe182f953df71a145f557cffaffc1bf
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
