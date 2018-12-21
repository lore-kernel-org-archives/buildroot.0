From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Dec 2018 14:53:56 +0100
Subject: [Buildroot] [git commit] python-engineio: bump to version 3.1.1
Message-ID: <20181221134956.B1C36817D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=416d46d72ba2f80398942b5cd29e412f28c43ee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 47e2333ecd..b92b908a64 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	3e2428aa3b9ba1d1ff5b6bff2c306e7e  python-engineio-3.1.0.tar.gz
-sha256	d7341725001afded65e42620e26adc54a450cf4082dd54a407480cb9a64fcdf9  python-engineio-3.1.0.tar.gz
+md5	203f9b530086c83b6948d750c080d14e  python-engineio-3.1.1.tar.gz
+sha256	3ec885307c404ff97d14dbdbf1461ede14c70c5adb015b2c97666819edbeef81  python-engineio-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index f31b948e3c..de9070a55d 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 3.1.0
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/25/37/57dc050723f3e64a0a652711b3831263d99f5ade2e05e5d6038354be7eaa
+PYTHON_ENGINEIO_VERSION = 3.1.1
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/c7/fd/9dad6c1794be838c05610c04e869bca9a3e0d94145ac71e57a9345a784b9
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
