From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:47:13 +0200
Subject: [Buildroot] [git commit] package/python-pexpect: bump to version
 4.7.0
Message-ID: <20191005150350.0448488454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5840634bf86cbcc2050414faee3f10cbf53141e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pexpect/python-pexpect.hash | 4 ++--
 package/python-pexpect/python-pexpect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
index bdeedefaa0..6972cdb806 100644
--- a/package/python-pexpect/python-pexpect.hash
+++ b/package/python-pexpect/python-pexpect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pexpect/json
-md5	d4f3372965a996238d57d19b95d2e03a  pexpect-4.6.0.tar.gz
-sha256	2a8e88259839571d1251d278476f3eec5db26deb73a70be5ed5dc5435e418aba  pexpect-4.6.0.tar.gz
+md5	ed003242cbf308aee1b1eaecdef59e43  pexpect-4.7.0.tar.gz
+sha256	9e2c1fd0e6ee3a49b28f95d4b33bc389c89b20af6a1255906e90ff1262ce62eb  pexpect-4.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256	4a483ae1c4dc738a6c8b73feb49074e1835da02ab5aa686f2675029906fa364d  LICENSE
diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
index 5c385cefb0..45e331f647 100644
--- a/package/python-pexpect/python-pexpect.mk
+++ b/package/python-pexpect/python-pexpect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PEXPECT_VERSION = 4.6.0
+PYTHON_PEXPECT_VERSION = 4.7.0
 PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
-PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/89/43/07d07654ee3e25235d8cea4164cdee0ec39d1fda8e9203156ebe403ffda4
+PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/1c/b1/362a0d4235496cb42c33d1d8732b5e2c607b0129ad5fdd76f5a583b9fcb3
 PYTHON_PEXPECT_LICENSE = ISC
 PYTHON_PEXPECT_LICENSE_FILES = LICENSE
 PYTHON_PEXPECT_SETUP_TYPE = distutils
