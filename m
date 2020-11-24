From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 23 Nov 2020 18:59:27 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-jinja2: bump to
 version 1.4.2
Message-ID: <20201124015927.2259157-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License hash changed due to formatting change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash | 6 +++---
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
index 3563d2ab4b..44e2ae463f 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-jinja2/json
-md5	7eb1a9be9e776c94d3bff73330c213d0  aiohttp-jinja2-1.2.0.tar.gz
-sha256	2dfe29cfd278d07cd0a851afb98471bc8ce2a830968443e40d67636f3c035d79  aiohttp-jinja2-1.2.0.tar.gz
+md5  d474a6440ac906a9d818a03a540830ba  aiohttp-jinja2-1.4.2.tar.gz
+sha256  9c22a0e48e3b277fc145c67dd8c3b8f609dab36bce9eb337f70dfe716663c9a0  aiohttp-jinja2-1.4.2.tar.gz
 # Locally computed sha256 checksums
-sha256	2a86817fedf0c52baaa47d7dd975073639dfaaebd37312bd279de54d7f841791  LICENSE
+sha256  d9d867affaeac220a60381cc544681dcd37c668ed6ea5ddbf9948617f828889a  LICENSE
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
index 94a0c9d75a..724acdb601 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_JINJA2_VERSION = 1.2.0
+PYTHON_AIOHTTP_JINJA2_VERSION = 1.4.2
 PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
-PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/9c/fb/8f1f8941e1e1937247c6de552668d73ab8ef860a1d633072d9f4e3c9b542
+PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/da/4f/3b1a0c7177fdb0417308a95bfa8340f19cf84b44f8f2d734cd3052f56644
 PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
-- 
2.25.1
