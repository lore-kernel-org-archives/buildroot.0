From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:45:54 +0200
Subject: [Buildroot] [git commit] python-pycrypto: bump to version 2.6.1
Message-ID: <20160330154725.96AEB80767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8e76ce573fcaffcf47267e9e4223d978d698830
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pycrypto/python-pycrypto.hash | 2 +-
 package/python-pycrypto/python-pycrypto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pycrypto/python-pycrypto.hash b/package/python-pycrypto/python-pycrypto.hash
index e7f809a..4637894 100644
--- a/package/python-pycrypto/python-pycrypto.hash
+++ b/package/python-pycrypto/python-pycrypto.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7293c9d7e8af2e44a82f86eb9c3b058880f4bcc884bf3ad6c8a34b64986edde8	pycrypto-2.6.tar.gz
+sha256	f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c	pycrypto-2.6.1.tar.gz
diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
index 20ff4a3..71943fa 100644
--- a/package/python-pycrypto/python-pycrypto.mk
+++ b/package/python-pycrypto/python-pycrypto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTO_VERSION = 2.6
+PYTHON_PYCRYPTO_VERSION = 2.6.1
 PYTHON_PYCRYPTO_SOURCE = pycrypto-$(PYTHON_PYCRYPTO_VERSION).tar.gz
 PYTHON_PYCRYPTO_SITE = http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto
 PYTHON_PYCRYPTO_SETUP_TYPE = distutils
