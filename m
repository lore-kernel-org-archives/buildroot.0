From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:57 +0200
Subject: [Buildroot] [git commit] package/python-requests: bump version to
	2.11.1
Message-ID: <20161005210759.0D5F580822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fd6ca2e968d374e753dc9f2aee43673fca8e692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-requests/python-requests.hash | 6 +++---
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index b567fe6..e441c00 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=0b7f480d19012ec52bab78292efd976d, sha256 locally computed
-md5	0b7f480d19012ec52bab78292efd976d  requests-2.9.1.tar.gz
-sha256	c577815dd00f1394203fc44eb979724b098f88264a9ef898ee45b8e5e9cf587f  requests-2.9.1.tar.gz
+# md5 from https://pypi.python.org/pypi/requests/json, sha256 locally computed
+md5	ad5f9c47b5c5dfdb28363ad7546b0763  requests-2.11.1.tar.gz
+sha256	5acf980358283faba0b897c73959cecf8b841205bb4b2ad3ef545f46eae1a133  requests-2.11.1.tar.gz
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 8cda2c5..49980bf 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.9.1
+PYTHON_REQUESTS_VERSION = 2.11.1
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = http://pypi.python.org/packages/source/r/requests
+PYTHON_REQUESTS_SITE = https://pypi.python.org/packages/2e/ad/e627446492cc374c284e82381215dcd9a0a87c4f6e90e9789afefe6da0ad
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
