From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 10:41:07 +0100
Subject: [Buildroot] [git commit] python-engineio: bump to version 3.3.0
Message-ID: <20190127095108.3F86983BE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e881a3ef382373a0bed91c58a530f22cec6f645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 3b16d7ef61..09e004ac46 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	ba0fd43c77028bd6fed4ee1004f37c71  python-engineio-3.2.3.tar.gz
-sha256	401458bb0046d950c429dac3ef82ce12e3ff1236f63b4bbb344d60a1b51c4e94  python-engineio-3.2.3.tar.gz
+md5	ad32353278d0576bfa7d7a2f9b97dec5  python-engineio-3.3.0.tar.gz
+sha256	e4ac17c04c32ccca67287dfdbbe4ee1e9eec3a0a1a9a6070f3ab784db08407dd  python-engineio-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 8d4e344247..c20101984b 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 3.2.3
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/e6/1e/64fd629f8215b81bf0e5682504ebbbd10d1d48e52ee30d053484b6e91421
+PYTHON_ENGINEIO_VERSION = 3.3.0
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/2f/09/83d627ad3dadd064bfb875c7767e93f3568354fe82cebe298b4e07f79238
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
