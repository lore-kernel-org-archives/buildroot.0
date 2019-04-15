From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 15 Apr 2019 16:04:36 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-schedule: bump to version
 0.6.0
Message-ID: <20190415230436.20023-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/python-schedule/python-schedule.hash | 8 ++++----
 package/python-schedule/python-schedule.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-schedule/python-schedule.hash b/package/python-schedule/python-schedule.hash
index 92475f973c..79777829de 100644
--- a/package/python-schedule/python-schedule.hash
+++ b/package/python-schedule/python-schedule.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/schedule/json, sha256 locally computed
-md5	53fb2e550b2539264eeceb5d85e82759  schedule-0.5.0.tar.gz
-sha256	1003a07c2dce12828c25a03a611a7371cedfa956e5f1b4abc32bcc94eb5a335b  schedule-0.5.0.tar.gz
-# License file, locally calculated
+# md5, sha256 from https://pypi.org/pypi/schedule/json
+md5	e29fd3b436b03220e147a4ed8191d220  schedule-0.6.0.tar.gz
+sha256	f9fb5181283de4db6e701d476dd01b6a3dd81c38462a54991ddbb9d26db857c9  schedule-0.6.0.tar.gz
+# Locally computed sha256 checksums
 sha256	30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
diff --git a/package/python-schedule/python-schedule.mk b/package/python-schedule/python-schedule.mk
index 16612a0881..c0cc7dce8c 100644
--- a/package/python-schedule/python-schedule.mk
+++ b/package/python-schedule/python-schedule.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCHEDULE_VERSION = 0.5.0
+PYTHON_SCHEDULE_VERSION = 0.6.0
 PYTHON_SCHEDULE_SOURCE = schedule-$(PYTHON_SCHEDULE_VERSION).tar.gz
-PYTHON_SCHEDULE_SITE = https://pypi.python.org/packages/fd/31/599a3387c2e98c270d5ac21a1575f3eb60a3712c192a0ca97a494a207739
+PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/00/07/6a9953ff83e003eaadebf0a51d33c6b596f9451fcbea36a3a2e575f6af99
 PYTHON_SCHEDULE_SETUP_TYPE = setuptools
 PYTHON_SCHEDULE_LICENSE = MIT
 PYTHON_SCHEDULE_LICENSE_FILES = LICENSE.txt
-- 
2.21.0
