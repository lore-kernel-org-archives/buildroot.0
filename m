From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 10 Jan 2020 08:16:35 -0800
Subject: [Buildroot] [PATCH 3/3] package/python-daphne: bump version to 2.4.1
In-Reply-To: <20200110161635.35043-1-aduskett@gmail.com>
References: <20200110161635.35043-1-aduskett@gmail.com>
Message-ID: <20200110161635.35043-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Use the LICENSE file for the license. This prevents having to change the
    sha256sum on every version bump due to PKG-INFO containing the version
    number.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-daphne/python-daphne.hash | 6 +++---
 package/python-daphne/python-daphne.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
index 17c13e12c1..cdf5e83ebb 100644
--- a/package/python-daphne/python-daphne.hash
+++ b/package/python-daphne/python-daphne.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daphne/json
-md5	1e8c391395ade46abe8cca84e3a9746a  daphne-2.4.0.tar.gz
-sha256	5af4d83c8ecf11a4d8ed65ced02d8336d52d90d213dfcd184d07222d36da433c  daphne-2.4.0.tar.gz
+md5	564353eaed92659e3b113d966a0288f2  daphne-2.4.1.tar.gz0
+sha256  1e41d02d78da373c1f8504835cdca6d447b5d64c2941661d4bd968d412b6c383  daphne-2.4.1.tar.gz
 # Locally computed sha256
-sha256 d0916b2b91afac6090fc01501e895a3cea81141d4b10c702db9e0a057ca5a563 PKG-INFO
+sha256 b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669 LICENSE
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
index 3d625c85ec..cd4739db19 100644
--- a/package/python-daphne/python-daphne.mk
+++ b/package/python-daphne/python-daphne.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_DAPHNE_VERSION = 2.4.0
+PYTHON_DAPHNE_VERSION = 2.4.1
 PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
-PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/c6/66/05ace288000d323831a9fab1e68a5625b117b7c8aca408404d33330f3906
+PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/03/6c/847d1c962f8c45aa2ab0791583c4a41669d158e28fd6369ce940b8ea8417
 PYTHON_DAPHNE_SETUP_TYPE = setuptools
 # https://github.com/django/daphne/blob/master/LICENSE
 PYTHON_DAPHNE_LICENSE = BSD-3-Clause
-PYTHON_DAPHNE_LICENSE_FILES = PKG-INFO
+PYTHON_DAPHNE_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.21.0 (Apple Git-122.2)
