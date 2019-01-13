From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:14:04 +0100
Subject: [Buildroot] [git commit] package/python-engineio: bump to version
 3.2.3
Message-ID: <20190113131422.757F9884F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cff057eae53bbce54ef708dda43c76eb3cf8b5d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index b92b908a64..3b16d7ef61 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	203f9b530086c83b6948d750c080d14e  python-engineio-3.1.1.tar.gz
-sha256	3ec885307c404ff97d14dbdbf1461ede14c70c5adb015b2c97666819edbeef81  python-engineio-3.1.1.tar.gz
+md5	ba0fd43c77028bd6fed4ee1004f37c71  python-engineio-3.2.3.tar.gz
+sha256	401458bb0046d950c429dac3ef82ce12e3ff1236f63b4bbb344d60a1b51c4e94  python-engineio-3.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index de9070a55d..8d4e344247 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 3.1.1
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/c7/fd/9dad6c1794be838c05610c04e869bca9a3e0d94145ac71e57a9345a784b9
+PYTHON_ENGINEIO_VERSION = 3.2.3
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/e6/1e/64fd629f8215b81bf0e5682504ebbbd10d1d48e52ee30d053484b6e91421
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
