From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  5 Jul 2020 15:42:30 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.2.1
Message-ID: <20200705214230.3869525-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 93173e4721..3aaeaa2eaf 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  8eeeee86f96c51d202e69f0e0a56eaad  aioconsole-0.1.16.tar.gz
-sha256  a5d98a99539e060f514b96425f19839abc4bc2b487b39cdb76b91df2367c647a  aioconsole-0.1.16.tar.gz
+md5  cf0a22b980bfd30e0c72160de8c66cbb  aioconsole-0.2.1.tar.gz
+sha256  f63d007c5c0fd5a30769af0a6b749307ea86001c4f217d3e5e9e248ccdfec1d0  aioconsole-0.2.1.tar.gz
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index ef0aa2faee..ecebc8af00 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.1.16
+PYTHON_AIOCONSOLE_VERSION = 0.2.1
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/70/08/5dbb71777058a4f3b6e61b61ffc5b5021056c4a139e118938773b93e9304
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/06/24/d88c186e84457b6a7a2a01c21ccf1e9a1125b5d33157acb28388bfc0a73c
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 
-- 
2.25.1
