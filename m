From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 22:48:45 +0100
Subject: [Buildroot] [git commit] python-pytz: bump to version 2018.7
Message-ID: <20181030214924.E5D4C836A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=122792e9e672c2538bafd65fddece9ae5408cc62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index 5634d5d624..78234ace81 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5	6c92d86f9e92e71c561b1adc213feba0  pytz-2018.6.tar.gz
-sha256	642253af8eae734d1509fc6ac9c1aee5e5b69d76392660889979b9870610a46b  pytz-2018.6.tar.gz
+md5	4b91594c440aa20c76ac92043efa75e1  pytz-2018.7.tar.gz
+sha256	31cb35c89bd7d333cd32c5f278fca91b523b0834369e757f4c5641ea252236ca  pytz-2018.7.tar.gz
 # Locally computed sha256 checksums
 sha256	39f07c72a1bfda349cbd27bac9bcb1e6f8c5b4e5cc3fadf56900406e8cc0b792  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 9a0ea19375..dc6046d037 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2018.6
+PYTHON_PYTZ_VERSION = 2018.7
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/c7/df/68a3331691a604a8241335064cf20742338d66eb008da96d4c9f3e3d4c41
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/cd/71/ae99fc3df1b1c5267d37ef2c51b7d79c44ba8a5e37b48e3ca93b4d74d98b
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
