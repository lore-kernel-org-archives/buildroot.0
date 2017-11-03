From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 21:57:31 +0100
Subject: [Buildroot] [git commit] python-m2r: bump version to 0.1.12
Message-ID: <20171103205059.EAAF08121B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=defba6775390bf99aae5eee032cb9b807282b76e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licence file checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-m2r/python-m2r.hash | 5 +++--
 package/python-m2r/python-m2r.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-m2r/python-m2r.hash b/package/python-m2r/python-m2r.hash
index 102da33..50de2b4 100644
--- a/package/python-m2r/python-m2r.hash
+++ b/package/python-m2r/python-m2r.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/m2r/json, sha256 locally computed
-md5	aac67f2167a3d81c8ccd7615e9c2cb7a  m2r-0.1.6.tar.gz
-sha256	a26bc2e25e0ad3f8650385aea25cf734ac4fcd30e54faec92fd39675da75e527  m2r-0.1.6.tar.gz
+md5	906eb6dabb0295c93881f32d0a1c0919  m2r-0.1.12.tar.gz
+sha256	adfb86ebb7ff3fcd3ebb27ce8cd6f795c409a13f0c03363e265f17419ce5b9ab  m2r-0.1.12.tar.gz
+sha256  28728ec0ecbd8c171ebaeccebf69e3961282fd81f06abc7424c65546b6ae6f27  LICENSE
diff --git a/package/python-m2r/python-m2r.mk b/package/python-m2r/python-m2r.mk
index b506ad8..7c8ed28 100644
--- a/package/python-m2r/python-m2r.mk
+++ b/package/python-m2r/python-m2r.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_M2R_VERSION = 0.1.6
+PYTHON_M2R_VERSION = 0.1.12
 PYTHON_M2R_SOURCE = m2r-$(PYTHON_M2R_VERSION).tar.gz
-PYTHON_M2R_SITE = https://pypi.python.org/packages/8d/74/558f9aba132bb34cd661fad9e17d42bfa1332363466ff314e600096f78c3
+PYTHON_M2R_SITE = https://pypi.python.org/packages/a0/95/7273d54664e74c3100d07206fe6b30247be046b39676972fc90ae04376a1
 PYTHON_M2R_SETUP_TYPE = setuptools
 PYTHON_M2R_LICENSE = MIT
 PYTHON_M2R_LICENSE_FILES = LICENSE
