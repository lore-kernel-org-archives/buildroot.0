From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 6 Apr 2021 22:22:09 +0200
Subject: [Buildroot] [git commit] package/python-websocket-client: bump to
 version 0.58
Message-ID: <20210406200853.6B1B38365F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e44b1b838cbd9b99ceec48fc80640372046ebb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of LICENSE (license switched back to LGPL-2.1+:
  https://github.com/websocket-client/websocket-client/commit/6eaed48d49ea6a1a792b152a477bf9026f0c29b4)
- Update indentation in hash file (two spaces)

https://github.com/websocket-client/websocket-client/blob/v0.58.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-websocket-client/python-websocket-client.hash | 6 +++---
 package/python-websocket-client/python-websocket-client.mk   | 9 +++------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index 968c1ab211..1e745dc1d5 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websocket-client/json
-md5	8061820da5e1de26a6a1a6996d4eebd5  websocket_client-0.57.0.tar.gz
-sha256	d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010  websocket_client-0.57.0.tar.gz
+md5  8fc86b13dc97dc032855c6257f9168df  websocket_client-0.58.0.tar.gz
+sha256  63509b41d158ae5b7f67eb4ad20fecbb4eee99434e73e140354dc3ff8e09716f  websocket_client-0.58.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a47b06717e8a3cf01d1307141287b1b4fa17fe4bb8785633d2fc6f57cb71d05e  LICENSE
+sha256  7c6699c75f87b52bdc542db26d6b1b92892577cda46e20eceb79e2790a1c291b  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index 58cb597c22..d2873e3601 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 0.57.0
+PYTHON_WEBSOCKET_CLIENT_VERSION = 0.58.0
 PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/8b/0f/52de51b9b450ed52694208ab952d5af6ebbcbce7f166a48784095d930d8c
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/4a/df/112c278ba1ead96786d24d973429ce1e1a2c86b9843183d9f8ef8c6330d7
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
-# Project was under LGPL-2.1+, but was relicensed under
-# BSD-3-Clause. The LICENSE file contains the BSD-3-Clause text, but
-# the source files still contain a LGPL-2.1+ header.
-PYTHON_WEBSOCKET_CLIENT_LICENSE = LGPL-2.1+, BSD-3-Clause
+PYTHON_WEBSOCKET_CLIENT_LICENSE = LGPL-2.1+
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
