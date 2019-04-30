From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 30 Apr 2019 09:19:17 -0400
Subject: [Buildroot] [PATCH 09/11] package/python-flask: bump to version
 1.0.2
In-Reply-To: <20190430131919.130128-1-aduskett@gmail.com>
References: <20190430131919.130128-1-aduskett@gmail.com>
Message-ID: <20190430131919.130128-10-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also add hash for the license file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-flask/python-flask.hash | 5 +++--
 package/python-flask/python-flask.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index ca117218ea..4b34ea82a0 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/Flask/json, sha256 locally computed
-md5	97278dfdafda98ba7902e890b0289177  Flask-0.12.2.tar.gz
-sha256	49f44461237b69ecd901cc7ce66feea0319b9158743dd27a2899962ab214dac1  Flask-0.12.2.tar.gz
+md5	824f0f20aae1f44c9c7dc4054adb7969  Flask-1.0.2.tar.gz
+sha256	2271c0070dbcb5275fad4a82e29f23ab92682dc45f9dfbc22c02ba9b9322ce48  Flask-1.0.2.tar.gz
+sha256	ce2117037008b9a8949f5a9ee1c7755f10844964d8ae4e138cded06f4e89de5f  LICENSE
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 06b1b4d9d1..344eba5edb 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 0.12.2
+PYTHON_FLASK_VERSION = 1.0.2
 PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://pypi.python.org/packages/eb/12/1c7bd06fcbd08ba544f25bf2c6612e305a70ea51ca0eda8007344ec3f123
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4b/12/c1fbf4971fda0e4de05565694c9f0c92646223cff53f15b6eb248a310a62
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE
-- 
2.20.1
