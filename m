From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 Nov 2019 00:55:55 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-session: bump to
 version 2.9.0
Message-ID: <20191111075555.117744-1-james.hilliard1@gmail.com>
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
index 794c272b0d..f10827b616 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.hash
+++ b/package/python-aiohttp-session/python-aiohttp-session.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
-md5	64ba16af01abad4fc1feaf16fba574c6  aiohttp-session-2.8.0.tar.gz
-sha256	4975ad108341520a7107f5e4d482c6a9f2bbc367b9c9b08e7df524d353f5f0cb  aiohttp-session-2.8.0.tar.gz
+md5	993ec277ece4765472d0edc0f6c0bba3  aiohttp-session-2.9.0.tar.gz
+sha256	959413468b84e30e7ca09719617cfb0000066a2e0f6c20062d043433e82aeb74  aiohttp-session-2.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256	2a86817fedf0c52baaa47d7dd975073639dfaaebd37312bd279de54d7f841791  LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index 093459a9ca..8fcd8e21b9 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SESSION_VERSION = 2.8.0
+PYTHON_AIOHTTP_SESSION_VERSION = 2.9.0
 PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/a1/da/d49d017faadb5e2c754fce83e1bd3fbcea9d10bc970bc8df9471880463f0
+PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/f8/fe/53dfd35f5c7fcc7f2d0866cb29e722303e3fae7f749c1f3d4d11d361dc38
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
-- 
2.20.1
