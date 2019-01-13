From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:13:47 +0100
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 19.1.1
Message-ID: <20190113131422.6455281361@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5776c4e79ac7dd2a5ac0e774d5f1bce698689a95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index f6023ab2ee..dce40f160e 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5	51b416c5503127911d9d8f1254967d44  autobahn-18.12.1.tar.gz
-sha256	bec9e04c97536a6c0044965db4a478672a01c4adee0aa84d9c4a0945b2adc879  autobahn-18.12.1.tar.gz
+md5	b296b8ae0f42e7df8052b28d574ede82  autobahn-19.1.1.tar.gz
+sha256	aebbadb700c13792a2967c79002855d1153b9ec8f2949d169e908388699596ff  autobahn-19.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 6d51ede723..213e0314c9 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 18.12.1
+PYTHON_AUTOBAHN_VERSION = 19.1.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/76/5b/ab59e271a11a08d02b1a3a3b777f7dde442cf89b169bbc67219016a84e7e
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/66/cc/1e2b20dc6654d9a87fc30da36bfae687ec65428814378c44257a26fe5f2f
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
