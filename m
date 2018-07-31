From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 21:52:11 +0200
Subject: [Buildroot] [git commit] package/python-requests-oauthlib: bump
 version to 1.0.0
Message-ID: <20180731194702.210CA8A5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d90706ef1edfd73392b133058e7fe285ad1a246
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package using scanpypi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-requests-oauthlib/python-requests-oauthlib.hash | 7 ++++---
 package/python-requests-oauthlib/python-requests-oauthlib.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.hash b/package/python-requests-oauthlib/python-requests-oauthlib.hash
index be0f644b80..733d293386 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.hash
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/requests_oauthlib/json, sha256 locally computed
-md5	4358a879a4377393bcfd37d0f9ae6d4d  requests-oauthlib-0.8.0.tar.gz
-sha256	883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468  requests-oauthlib-0.8.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/requests-oauthlib/json
+md5	e867404084b688dbfb879b9ac9ac040a  requests-oauthlib-1.0.0.tar.gz
+sha256	8886bfec5ad7afb391ed5443b1f697c6f4ae98d0e5620839d8b4499c032ada3f  requests-oauthlib-1.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256	ae01846afad8a8291fe6a08966f3015af9a8ff675d84b981f9793c122f7876e8  LICENSE
diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.mk b/package/python-requests-oauthlib/python-requests-oauthlib.mk
index 02e3114e59..a8761b18b1 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.mk
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_OAUTHLIB_VERSION = 0.8.0
+PYTHON_REQUESTS_OAUTHLIB_VERSION = 1.0.0
 PYTHON_REQUESTS_OAUTHLIB_SOURCE = requests-oauthlib-$(PYTHON_REQUESTS_OAUTHLIB_VERSION).tar.gz
-PYTHON_REQUESTS_OAUTHLIB_SITE = https://pypi.python.org/packages/80/14/ad120c720f86c547ba8988010d5186102030591f71f7099f23921ca47fe5
+PYTHON_REQUESTS_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/95/be/072464f05b70e4142cb37151e215a2037b08b1400f8a56f2538b76ca6205
 PYTHON_REQUESTS_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_OAUTHLIB_LICENSE = ISC
 PYTHON_REQUESTS_OAUTHLIB_LICENSE_FILES = LICENSE
