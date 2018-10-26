From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 13:54:41 +0200
Subject: [Buildroot] [git commit] python-dateutil: bump to version 2.7.4
Message-ID: <20181026115311.AD15888FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9487d99f2fd254e15f649e22099346429abeec9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dateutil/python-dateutil.hash | 4 ++--
 package/python-dateutil/python-dateutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
index c55128f507..e45da864b8 100644
--- a/package/python-dateutil/python-dateutil.hash
+++ b/package/python-dateutil/python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dateutil/json
-md5	175b7c1a3cc0cb01151eced07c61c0b8  python-dateutil-2.7.3.tar.gz
-sha256	e27001de32f627c22380a688bcc43ce83504a7bc5da472209b4c70f02829f0b8  python-dateutil-2.7.3.tar.gz
+md5	0fcdcec70ebf8cdc469c647fa4966794  python-dateutil-2.7.4.tar.gz
+sha256	2f13d3ea236aeb237e7258d5729c46eafe1506fd7f8507f34730734ed8b37454  python-dateutil-2.7.4.tar.gz
 # Locally computed sha256 checksums
 sha256	ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index 73c3c35aaf..4207a459d0 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DATEUTIL_VERSION = 2.7.3
-PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15
+PYTHON_DATEUTIL_VERSION = 2.7.4
+PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/a5/15/37f2e39504a98ec4b3eba8c9a61755dd5374388201ee60d1ae5b8e7a3d09
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
