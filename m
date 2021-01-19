From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 21:50:40 +0100
Subject: [Buildroot] [git commit] package/python-jmespath: bump to version
 0.10.0
Message-ID: <20210119203252.A4A0B8850F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7546c7ca47abc589225acd8b6c758bb3f90f442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rapha??l M??lotte <raphael.melotte@essensium.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jmespath/python-jmespath.hash | 4 ++--
 package/python-jmespath/python-jmespath.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jmespath/python-jmespath.hash b/package/python-jmespath/python-jmespath.hash
index 4d1ccb5bbb..986db2e002 100644
--- a/package/python-jmespath/python-jmespath.hash
+++ b/package/python-jmespath/python-jmespath.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jmespath/json
-md5  5c3380a84c565d7438e4766fd4b7a775  jmespath-0.9.4.tar.gz
-sha256  bde2aef6f44302dfb30320115b17d030798de8c4110e28d5cf6cf91a7a31074c  jmespath-0.9.4.tar.gz
+md5  65bdcb5fa5bcf1cc710ffa508e78e408  jmespath-0.10.0.tar.gz
+sha256  b85d0567b8666149a93172712e68920734333c0ce7e89b78b3e987f71e5ed4f9  jmespath-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  66b313cce80ed0623fc7db3f24863a0c80fd83eb341a46b57864158ae74faa56  LICENSE.txt
diff --git a/package/python-jmespath/python-jmespath.mk b/package/python-jmespath/python-jmespath.mk
index 4afd06fd48..cf11dedb60 100644
--- a/package/python-jmespath/python-jmespath.mk
+++ b/package/python-jmespath/python-jmespath.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JMESPATH_VERSION = 0.9.4
+PYTHON_JMESPATH_VERSION = 0.10.0
 PYTHON_JMESPATH_SOURCE = jmespath-$(PYTHON_JMESPATH_VERSION).tar.gz
-PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/2c/30/f0162d3d83e398c7a3b70c91eef61d409dea205fb4dc2b47d335f429de32
+PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/3c/56/3f325b1eef9791759784aa5046a8f6a1aff8f7c898a2e34506771d3b99d8
 PYTHON_JMESPATH_SETUP_TYPE = setuptools
 PYTHON_JMESPATH_LICENSE = MIT
 PYTHON_JMESPATH_LICENSE_FILES = LICENSE.txt
