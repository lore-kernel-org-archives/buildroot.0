From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 14:35:46 +0200
Subject: [Buildroot] [git commit] package/python-aioconsole: bump to version
 0.3.0
Message-ID: <20200920122633.1D733814C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d024ca2d3a88de0c6b942628979be9dc2af5193
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 3aaeaa2eaf..0aa9a7882c 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  cf0a22b980bfd30e0c72160de8c66cbb  aioconsole-0.2.1.tar.gz
-sha256  f63d007c5c0fd5a30769af0a6b749307ea86001c4f217d3e5e9e248ccdfec1d0  aioconsole-0.2.1.tar.gz
+md5  a8b0640a1e2a3869baf4efcbb1182fbe  aioconsole-0.3.0.tar.gz
+sha256  b84724e6b93d1306a909974864df377236cf4bab8e0594096fed7936207205c5  aioconsole-0.3.0.tar.gz
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index ecebc8af00..5c26d863c0 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.2.1
+PYTHON_AIOCONSOLE_VERSION = 0.3.0
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/06/24/d88c186e84457b6a7a2a01c21ccf1e9a1125b5d33157acb28388bfc0a73c
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/d1/bc/2e52bd41293e63d95fcb6c5de406d43ccbb91255a48feaa22c1b8e2e4a40
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 
