From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 20:59:11 +0100
Subject: [Buildroot] [git commit] package/python-txdbus: bump to version
 1.1.2
Message-ID: <20201229194852.9FE9582297@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=903a733fda709c704cc3a04560738476d8816113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txdbus/python-txdbus.hash | 4 ++--
 package/python-txdbus/python-txdbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txdbus/python-txdbus.hash b/package/python-txdbus/python-txdbus.hash
index 60740e29d2..5d386272b8 100644
--- a/package/python-txdbus/python-txdbus.hash
+++ b/package/python-txdbus/python-txdbus.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/txdbus/json
-sha256	eefcffa4efbf82ba11222f17f5989fe1b2b6ef57226ef896c4a7084c990ba217  txdbus-1.1.1.tar.gz
-md5	ce8a0e0a17cdbada725e3159802ae75f  txdbus-1.1.1.tar.gz
+md5  d397357dee78750385f92ca9c6c1f063  txdbus-1.1.2.tar.gz
+sha256  8375a5fb68a12054f0def91af800c821fb2232949337756ed975f88d8ea2bc97  txdbus-1.1.2.tar.gz
diff --git a/package/python-txdbus/python-txdbus.mk b/package/python-txdbus/python-txdbus.mk
index d8e7a7bee9..4e4ddf03cb 100644
--- a/package/python-txdbus/python-txdbus.mk
+++ b/package/python-txdbus/python-txdbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXDBUS_VERSION = 1.1.1
+PYTHON_TXDBUS_VERSION = 1.1.2
 PYTHON_TXDBUS_SOURCE = txdbus-$(PYTHON_TXDBUS_VERSION).tar.gz
-PYTHON_TXDBUS_SITE = https://files.pythonhosted.org/packages/4a/68/dfd06f3f349999cbbb31eade239fe76fbff2d6a905eb7d20449666d1b2ce
+PYTHON_TXDBUS_SITE = https://files.pythonhosted.org/packages/d6/ef/43377e975b8d37862fd1166a4998f908651f5e205ddc9bbd7a57c6e5b4b6
 PYTHON_TXDBUS_SETUP_TYPE = setuptools
 PYTHON_TXDBUS_LICENSE = MIT
 
