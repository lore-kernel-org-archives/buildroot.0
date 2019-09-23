From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:28:58 +0200
Subject: [Buildroot] [git commit] package/python-logbook: bump to version
 1.5.2
Message-ID: <20190923212435.D42B38F20E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43cfda07705a9249a58ad8c172b44865cb87f7f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-logbook/python-logbook.hash | 4 ++--
 package/python-logbook/python-logbook.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index 0db9def1ba..774aaf594d 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/logbook/json
-md5	352d66684713fc323febe60c9244270e  Logbook-1.4.3.tar.gz
-sha256	a5a96792abd8172c80d61b7530e134524f20e2841981038031e602ed5920fef5  Logbook-1.4.3.tar.gz
+md5	9fdaa126c21be04d936834abb0cb499d  Logbook-1.5.2.tar.gz
+sha256	1aeb299401d9fe228f204d83073f0ec240e3ae0d50295bf8e5be91a9cd8b7a57  Logbook-1.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256	2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index 4e9a5306d0..e637236679 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.4.3
+PYTHON_LOGBOOK_VERSION = 1.5.2
 PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/f6/83/20fc0270614919cb799f76e32cf143a54c58ce2fa45c19fd38ac2e4f9977
+PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/6b/3f/f4e6693791efacc1282852fba5392da0649b19416b37422c5489f79a52ea
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
