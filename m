From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 22:27:30 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-pexpect: bump to version
 4.8.0
Message-ID: <20200213052730.93302-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pexpect/python-pexpect.hash | 4 ++--
 package/python-pexpect/python-pexpect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
index 6972cdb806..87df05d881 100644
--- a/package/python-pexpect/python-pexpect.hash
+++ b/package/python-pexpect/python-pexpect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pexpect/json
-md5	ed003242cbf308aee1b1eaecdef59e43  pexpect-4.7.0.tar.gz
-sha256	9e2c1fd0e6ee3a49b28f95d4b33bc389c89b20af6a1255906e90ff1262ce62eb  pexpect-4.7.0.tar.gz
+md5	153eb25184249d6a85fde9acf4804085  pexpect-4.8.0.tar.gz
+sha256	fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c  pexpect-4.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256	4a483ae1c4dc738a6c8b73feb49074e1835da02ab5aa686f2675029906fa364d  LICENSE
diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
index 45e331f647..a9609cbe79 100644
--- a/package/python-pexpect/python-pexpect.mk
+++ b/package/python-pexpect/python-pexpect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PEXPECT_VERSION = 4.7.0
+PYTHON_PEXPECT_VERSION = 4.8.0
 PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
-PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/1c/b1/362a0d4235496cb42c33d1d8732b5e2c607b0129ad5fdd76f5a583b9fcb3
+PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/e5/9b/ff402e0e930e70467a7178abb7c128709a30dfb22d8777c043e501bc1b10
 PYTHON_PEXPECT_LICENSE = ISC
 PYTHON_PEXPECT_LICENSE_FILES = LICENSE
 PYTHON_PEXPECT_SETUP_TYPE = distutils
-- 
2.20.1
