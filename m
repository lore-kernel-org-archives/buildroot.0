From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:24 +0200
Subject: [Buildroot] [git commit] package/python-argh: bump version to 0.26.2
Message-ID: <20161005210757.B9AE180301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76cd20c98069704ef1bb7c3493ec6fdbf97d9994
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-argh/python-argh.hash | 7 +++----
 package/python-argh/python-argh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index 9e2e068..6f19de1 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/argh/json
-md5	5a97ce2ae74bbe3b63194906213f1184  argh-0.26.1.tar.gz
-# sha256 calculated by scanpypi
-sha256	06a7442cb9130fb8806fe336000fcf20edf1f2f8ad205e7b62cec118505510db  argh-0.26.1.tar.gz
+# md5 from https://pypi.python.org/pypi/argh/json, sha256 locally computed
+md5	edda25f3f0164a963dd89c0e3c619973  argh-0.26.2.tar.gz
+sha256	e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65  argh-0.26.2.tar.gz
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index 4b09e68..bc5d713 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGH_VERSION = 0.26.1
+PYTHON_ARGH_VERSION = 0.26.2
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
-PYTHON_ARGH_SITE = https://pypi.python.org/packages/14/7f/794a7f4a48cba505a4b4c714f81fed844a3a5f7340b171f448711439b09e
+PYTHON_ARGH_SITE = https://pypi.python.org/packages/e3/75/1183b5d1663a66aebb2c184e0398724b624cecd4f4b679cb6e25de97ed15
 PYTHON_ARGH_SETUP_TYPE = setuptools
 PYTHON_ARGH_LICENSE = LGPLv3+
 PYTHON_ARGH_LICENSE_FILES = README.rst
