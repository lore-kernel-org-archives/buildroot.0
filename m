From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:35 -0000
Subject: [Buildroot] [git commit] package/python-aiohttp-jinja2: bump to
 version 1.1.2
Message-ID: <20190903133619.4E4A181413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b6af91b33094d1b48144c9bfa8ad774a03a3abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash | 4 ++--
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
index 390b0e4ed7..28bd2c1ad5 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-jinja2/json
-md5	de5e02056d1b48dc2fa4fc0c1a8b0e08  aiohttp-jinja2-1.1.0.tar.gz
-sha256	aef9b6595f962182ad00c990095fb51d731c280e1d183e2b28cf0bdb5a942d0c  aiohttp-jinja2-1.1.0.tar.gz
+md5	d8e0f9e824ab62f3bd17abb604f5884e  aiohttp-jinja2-1.1.2.tar.gz
+sha256	4569ba360dbef2f6e2edfcb1eb34452e85498b7e17740baa5a4adc296ac3973c  aiohttp-jinja2-1.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256	2a86817fedf0c52baaa47d7dd975073639dfaaebd37312bd279de54d7f841791  LICENSE
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
index 3b5359a06a..059ba72ada 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_JINJA2_VERSION = 1.1.0
+PYTHON_AIOHTTP_JINJA2_VERSION = 1.1.2
 PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
-PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/76/9d/68fa1e9ec3bafba572772eb385023de54096663bd6e302a24d7344c6a711
+PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/65/ff/60a0fc663cb0410f33c2822c274ddb0cdb43985066498aef1b39126f26d2
 PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
