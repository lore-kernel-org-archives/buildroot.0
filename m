From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 30 Sep 2019 03:33:25 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-session: bump to
 version 2.8.0
Message-ID: <20190930093325.123530-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-session/python-aiohttp-session.hash | 4 ++--
 package/python-aiohttp-session/python-aiohttp-session.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
index fdccb20d1a..794c272b0d 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.hash
+++ b/package/python-aiohttp-session/python-aiohttp-session.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
-md5	a873141ee04ffc9fc948d9ee0ed47a8d  aiohttp-session-2.7.0.tar.gz
-sha256	18ae740845214086f783574edfee1bac36862332bd11d561e048b079d8f6ad34  aiohttp-session-2.7.0.tar.gz
+md5	64ba16af01abad4fc1feaf16fba574c6  aiohttp-session-2.8.0.tar.gz
+sha256	4975ad108341520a7107f5e4d482c6a9f2bbc367b9c9b08e7df524d353f5f0cb  aiohttp-session-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256	2a86817fedf0c52baaa47d7dd975073639dfaaebd37312bd279de54d7f841791  LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index 36c3180beb..093459a9ca 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SESSION_VERSION = 2.7.0
+PYTHON_AIOHTTP_SESSION_VERSION = 2.8.0
 PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/b5/5f/3f78fd4de2f9b17ad8cfe6c189bfaee3d0a5d2fe954aedad743edd08c813
+PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/a1/da/d49d017faadb5e2c754fce83e1bd3fbcea9d10bc970bc8df9471880463f0
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
-- 
2.20.1
