From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:17:28 +0200
Subject: [Buildroot] [git commit branch/next] package/python-engineio: bump
 to version 3.9.3
Message-ID: <20190829202159.965E48830F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b146ed5499bbfc4e9c7ebc154e454b30cdb168b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 09e004ac46..cf6acb60aa 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	ad32353278d0576bfa7d7a2f9b97dec5  python-engineio-3.3.0.tar.gz
-sha256	e4ac17c04c32ccca67287dfdbbe4ee1e9eec3a0a1a9a6070f3ab784db08407dd  python-engineio-3.3.0.tar.gz
+md5	11a4f18f5b08a36d07d3c0ff85e7c047  python-engineio-3.9.3.tar.gz
+sha256	2a4c874aea686e79f8ea9efc30748110df581df6d577d18bb5eaa1a8f2199d12  python-engineio-3.9.3.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index c20101984b..cfc7fcaf63 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 3.3.0
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/2f/09/83d627ad3dadd064bfb875c7767e93f3568354fe82cebe298b4e07f79238
+PYTHON_ENGINEIO_VERSION = 3.9.3
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/f4/e4/d46daeb6010781d56f3468d0ad4e11e2d44aafc4ec521327a19d80f536f2
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
