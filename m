From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Nov 2019 23:45:36 +0100
Subject: [Buildroot] [git commit branch/next] package/python-txdbus: bump to
 1.1.1
Message-ID: <20191116223937.6DB3A8F079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf053cf414d9290b68f4737dcf457b62fbb43842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-txdbus/python-txdbus.hash | 4 ++--
 package/python-txdbus/python-txdbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txdbus/python-txdbus.hash b/package/python-txdbus/python-txdbus.hash
index 38760fada6..60740e29d2 100644
--- a/package/python-txdbus/python-txdbus.hash
+++ b/package/python-txdbus/python-txdbus.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/txdbus/json
-md5	f17c9204c7f56365c297ba68e6840900  txdbus-1.1.0.tar.gz
-sha256	6ff57f42c58d935956024b3c6824c1019db7d233d0af86aa0573b73b63b0817c  txdbus-1.1.0.tar.gz
+sha256	eefcffa4efbf82ba11222f17f5989fe1b2b6ef57226ef896c4a7084c990ba217  txdbus-1.1.1.tar.gz
+md5	ce8a0e0a17cdbada725e3159802ae75f  txdbus-1.1.1.tar.gz
diff --git a/package/python-txdbus/python-txdbus.mk b/package/python-txdbus/python-txdbus.mk
index 08429baac8..d8e7a7bee9 100644
--- a/package/python-txdbus/python-txdbus.mk
+++ b/package/python-txdbus/python-txdbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXDBUS_VERSION = 1.1.0
+PYTHON_TXDBUS_VERSION = 1.1.1
 PYTHON_TXDBUS_SOURCE = txdbus-$(PYTHON_TXDBUS_VERSION).tar.gz
-PYTHON_TXDBUS_SITE = https://files.pythonhosted.org/packages/8e/7c/0b8726b82943ae99dc71b8fe20e2e0beb7feb4ef61105865021a64f08b16
+PYTHON_TXDBUS_SITE = https://files.pythonhosted.org/packages/4a/68/dfd06f3f349999cbbb31eade239fe76fbff2d6a905eb7d20449666d1b2ce
 PYTHON_TXDBUS_SETUP_TYPE = setuptools
 PYTHON_TXDBUS_LICENSE = MIT
 
