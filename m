From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  3 Jan 2017 10:15:42 +0100
Subject: [Buildroot] [PATCH 1/1] package: remove the default value of the
	$(PKG)_SOURCE variable
Message-ID: <1483434942-22000-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/alljoyn-base/alljoyn-base.mk                   | 1 -
 package/batman-adv/batman-adv.mk                       | 1 -
 package/circus/circus.mk                               | 1 -
 package/crudini/crudini.mk                             | 1 -
 package/eudev/eudev.mk                                 | 1 -
 package/evtest/evtest.mk                               | 1 -
 package/ibrcommon/ibrcommon.mk                         | 1 -
 package/ibrdtn/ibrdtn.mk                               | 1 -
 package/ibrdtnd/ibrdtnd.mk                             | 1 -
 package/log4cpp/log4cpp.mk                             | 1 -
 package/mariadb/mariadb.mk                             | 1 -
 package/ola/ola.mk                                     | 1 -
 package/proftpd/proftpd.mk                             | 1 -
 package/putty/putty.mk                                 | 1 -
 package/python-dateutil/python-dateutil.mk             | 1 -
 package/python-engineio/python-engineio.mk             | 1 -
 package/python-networkmanager/python-networkmanager.mk | 1 -
 package/python-socketio/python-socketio.mk             | 1 -
 package/syslog-ng/syslog-ng.mk                         | 1 -
 package/tpm-tools/tpm-tools.mk                         | 1 -
 package/trousers/trousers.mk                           | 1 -
 package/tunctl/tunctl.mk                               | 1 -
 22 files changed, 22 deletions(-)

diff --git a/package/alljoyn-base/alljoyn-base.mk b/package/alljoyn-base/alljoyn-base.mk
index bb07377..ad19802 100644
--- a/package/alljoyn-base/alljoyn-base.mk
+++ b/package/alljoyn-base/alljoyn-base.mk
@@ -6,7 +6,6 @@
 
 ALLJOYN_BASE_REV = 16.04
 ALLJOYN_BASE_VERSION = $(ALLJOYN_BASE_REV).00
-ALLJOYN_BASE_SOURCE = alljoyn-base-$(ALLJOYN_BASE_VERSION).tar.gz
 ALLJOYN_BASE_SITE = \
 	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_BASE_REV)
 # See https://allseenalliance.org/alliance/ip-policy
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 0691773..256781f 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -6,7 +6,6 @@
 
 BATMAN_ADV_VERSION = 2016.1
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
-BATMAN_ADV_SOURCE = batman-adv-$(BATMAN_ADV_VERSION).tar.gz
 BATMAN_ADV_LICENSE = GPLv2
 
 # Bridge Loop Avoidance, Distributed Arp Table are always enabled
diff --git a/package/circus/circus.mk b/package/circus/circus.mk
index a7693bd..35051c4 100644
--- a/package/circus/circus.mk
+++ b/package/circus/circus.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 CIRCUS_VERSION = 0.13.0
-CIRCUS_SOURCE = circus-$(CIRCUS_VERSION).tar.gz
 CIRCUS_SITE = https://pypi.python.org/packages/source/c/circus
 CIRCUS_SETUP_TYPE = setuptools
 CIRCUS_LICENSE = Apache-2.0
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index 9dfd174..501c9e0 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 CRUDINI_VERSION = 0.8
-CRUDINI_SOURCE = crudini-$(CRUDINI_VERSION).tar.gz
 CRUDINI_SITE = https://pypi.python.org/packages/23/4a/934b05bbe5af4fd390207c5e935efbae6439809aad65ab0702e236c1b5f5
 CRUDINI_SETUP_TYPE = setuptools
 CRUDINI_LICENSE = GPLv2
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index d803947..941b4d8 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 EUDEV_VERSION = 3.2.1
-EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 3e02f7c..5ff2bf3 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 EVTEST_VERSION = 1.33
-EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.gz
 EVTEST_SITE = http://cgit.freedesktop.org/evtest/snapshot
 EVTEST_LICENSE = GPLv2+
 EVTEST_LICENSE_FILES = COPYING
diff --git a/package/ibrcommon/ibrcommon.mk b/package/ibrcommon/ibrcommon.mk
index 5fa2cb5..4d2d351 100644
--- a/package/ibrcommon/ibrcommon.mk
+++ b/package/ibrcommon/ibrcommon.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 IBRCOMMON_VERSION = 1.0.1
-IBRCOMMON_SOURCE = ibrcommon-$(IBRCOMMON_VERSION).tar.gz
 IBRCOMMON_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
 IBRCOMMON_INSTALL_STAGING = YES
 IBRCOMMON_LICENSE = Apache-2.0
diff --git a/package/ibrdtn/ibrdtn.mk b/package/ibrdtn/ibrdtn.mk
index 7bd9b9b..3f805c4 100644
--- a/package/ibrdtn/ibrdtn.mk
+++ b/package/ibrdtn/ibrdtn.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 IBRDTN_VERSION = 1.0.1
-IBRDTN_SOURCE = ibrdtn-$(IBRDTN_VERSION).tar.gz
 IBRDTN_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
 IBRDTN_INSTALL_STAGING = YES
 IBRDTN_LICENSE = Apache-2.0
diff --git a/package/ibrdtnd/ibrdtnd.mk b/package/ibrdtnd/ibrdtnd.mk
index 01ebb7a..0632ed3 100644
--- a/package/ibrdtnd/ibrdtnd.mk
+++ b/package/ibrdtnd/ibrdtnd.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 IBRDTND_VERSION = 1.0.1
-IBRDTND_SOURCE = ibrdtnd-$(IBRDTND_VERSION).tar.gz
 IBRDTND_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
 IBRDTND_LICENSE = Apache-2.0
 IBRDTND_LICENSE_FILES = COPYING
diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
index 1630b90..df7109b 100755
--- a/package/log4cpp/log4cpp.mk
+++ b/package/log4cpp/log4cpp.mk
@@ -6,7 +6,6 @@
 
 LOG4CPP_VERSION_MAJOR = 1.1
 LOG4CPP_VERSION = $(LOG4CPP_VERSION_MAJOR).1
-LOG4CPP_SOURCE = log4cpp-$(LOG4CPP_VERSION).tar.gz
 LOG4CPP_SITE = http://downloads.sourceforge.net/project/log4cpp/log4cpp-1.1.x%20%28new%29/log4cpp-$(LOG4CPP_VERSION_MAJOR)
 LOG4CPP_SUBDIR = log4cpp
 # The "or later" is indicated in the HTML documentation
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 6c609da..086cdd7 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 MARIADB_VERSION = 10.1.20
-MARIADB_SOURCE = mariadb-$(MARIADB_VERSION).tar.gz
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPLv2 (server), GPLv2 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
 MARIADB_LICENSE_FILES = README COPYING COPYING.LESSER
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 93e84a6..cfd6638 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 OLA_VERSION = 0.10.2
-OLA_SOURCE = ola-$(OLA_VERSION).tar.gz
 OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VERSION)
 OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = LICENCE GPL LGPL
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index a70f41e..bfb8b78 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PROFTPD_VERSION = 1.3.5b
-PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.gz
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPLv2+
 PROFTPD_LICENSE_FILES = COPYING
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 7603f69..5155714 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PUTTY_VERSION = 0.67
-PUTTY_SOURCE = putty-$(PUTTY_VERSION).tar.gz
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_SUBDIR = unix
 PUTTY_LICENSE = MIT
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index 8d73d16..b1f5e68 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PYTHON_DATEUTIL_VERSION = 2.6.0
-PYTHON_DATEUTIL_SOURCE = python-dateutil-$(PYTHON_DATEUTIL_VERSION).tar.gz
 PYTHON_DATEUTIL_SITE = https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3c
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 700b638..61d5da9 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PYTHON_ENGINEIO_VERSION = 0.9.2
-PYTHON_ENGINEIO_SOURCE = python-engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
 PYTHON_ENGINEIO_SITE = https://pypi.python.org/packages/c3/8f/0e066fc7a7029893b96b1d68a0cd5e75f6410f154fa4079b2be4991f5ae0
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index 0a8c442..875748f 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PYTHON_NETWORKMANAGER_VERSION = 1.2.1
-PYTHON_NETWORKMANAGER_SOURCE = python-networkmanager-$(PYTHON_NETWORKMANAGER_VERSION).tar.gz
 PYTHON_NETWORKMANAGER_SITE = https://pypi.python.org/packages/e7/b1/09993250ceea9e03bc65fbabcd5286540200292c011b22237b2963c11471
 PYTHON_NETWORKMANAGER_SETUP_TYPE = distutils
 PYTHON_NETWORKMANAGER_LICENSE = GPLv3+
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index 3bcfed1..57dc1f8 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PYTHON_SOCKETIO_VERSION = 1.4.1
-PYTHON_SOCKETIO_SOURCE = python-socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
 PYTHON_SOCKETIO_SITE = https://pypi.python.org/packages/da/00/66103df6a116a2ce3ea662a9c8c80f337d43d7f138caf04e9af6dec24ba7
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index b4fc24b..cfc7d0d 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 SYSLOG_NG_VERSION = 3.7.3
-SYSLOG_NG_SOURCE = syslog-ng-$(SYSLOG_NG_VERSION).tar.gz
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPLv2.1+ (syslog-ng core), GPLv2+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING
diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
index 72afc44..c90edbb 100644
--- a/package/tpm-tools/tpm-tools.mk
+++ b/package/tpm-tools/tpm-tools.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 TPM_TOOLS_VERSION = 1.3.8
-TPM_TOOLS_SOURCE = tpm-tools-$(TPM_TOOLS_VERSION).tar.gz
 TPM_TOOLS_SITE = http://downloads.sourceforge.net/project/trousers/tpm-tools/$(TPM_TOOLS_VERSION)
 TPM_TOOLS_STRIP_COMPONENTS = 2
 TPM_TOOLS_LICENSE = Common Public License Version 1.0
diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index 4fc9499..41129eb 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -5,7 +5,6 @@
 ##############################################################
 
 TROUSERS_VERSION = 0.3.13
-TROUSERS_SOURCE = trousers-$(TROUSERS_VERSION).tar.gz
 TROUSERS_SITE = http://downloads.sourceforge.net/project/trousers/trousers/$(TROUSERS_VERSION)
 TROUSERS_LICENSE = BSD-3c
 TROUSERS_LICENSE_FILES = LICENSE
diff --git a/package/tunctl/tunctl.mk b/package/tunctl/tunctl.mk
index 81e6c8c..30dbbd1 100644
--- a/package/tunctl/tunctl.mk
+++ b/package/tunctl/tunctl.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 TUNCTL_VERSION = 1.5
-TUNCTL_SOURCE = tunctl-$(TUNCTL_VERSION).tar.gz
 TUNCTL_SITE = http://downloads.sourceforge.net/project/tunctl/tunctl/$(TUNCTL_VERSION)
 
 TUNCTL_LICENSE = GPLv2
-- 
1.9.1
