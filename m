From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  1 Nov 2019 19:04:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-jinja2: bump to
 version 1.2.0
Message-ID: <20191101170417.29286-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash | 4 ++--
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
index 28bd2c1ad5..3563d2ab4b 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-jinja2/json
-md5	d8e0f9e824ab62f3bd17abb604f5884e  aiohttp-jinja2-1.1.2.tar.gz
-sha256	4569ba360dbef2f6e2edfcb1eb34452e85498b7e17740baa5a4adc296ac3973c  aiohttp-jinja2-1.1.2.tar.gz
+md5	7eb1a9be9e776c94d3bff73330c213d0  aiohttp-jinja2-1.2.0.tar.gz
+sha256	2dfe29cfd278d07cd0a851afb98471bc8ce2a830968443e40d67636f3c035d79  aiohttp-jinja2-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256	2a86817fedf0c52baaa47d7dd975073639dfaaebd37312bd279de54d7f841791  LICENSE
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
index 059ba72ada..94a0c9d75a 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_JINJA2_VERSION = 1.1.2
+PYTHON_AIOHTTP_JINJA2_VERSION = 1.2.0
 PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
-PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/65/ff/60a0fc663cb0410f33c2822c274ddb0cdb43985066498aef1b39126f26d2
+PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/9c/fb/8f1f8941e1e1937247c6de552668d73ab8ef860a1d633072d9f4e3c9b542
 PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
-- 
2.20.1
