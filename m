From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:13:55 +0100
Subject: [Buildroot] [git commit] package/python-crossbar: bump to version
 19.1.1
Message-ID: <20190113131422.6C3E6884F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=666e43c2d7e8c06b44476dde1d5ea8672fc1d661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crossbar/python-crossbar.hash | 4 ++--
 package/python-crossbar/python-crossbar.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index 4b73f81338..665cc25d1f 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crossbar/json
-md5	2f48f40f7a43eced7cb74353a303c3db  crossbar-18.11.2.tar.gz
-sha256	8236f207222167747de006784a431cfa546f98b51f47e82cd71e7008f5a09690  crossbar-18.11.2.tar.gz
+md5	83c025eb8f1406642503aa590edabaf2  crossbar-19.1.1.tar.gz
+sha256	6b30970f8cbd6962581790444b19a0743f0c589bd441e727623e8a7004a8679b  crossbar-19.1.1.tar.gz
 # Locally computed
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 2a796f201f..787d0f9441 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 18.11.2
+PYTHON_CROSSBAR_VERSION = 19.1.1
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/f8/c7/1388883cb64db073c4878e0c83afedf785fd22e4cebc96523e105a000088
+PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/38/55/54ac74ca6b4a3b0fe5919fd7ee787c444ce79d8dca58d561ea3f8e185782
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
