From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 22:25:10 +0100
Subject: [Buildroot] [git commit] python-schedule: bump to version 0.5.0
Message-ID: <20180310212633.55AA682A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19bda730323e71c4f3078feb391e09f77a2b06fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-schedule/python-schedule.hash | 4 ++--
 package/python-schedule/python-schedule.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-schedule/python-schedule.hash b/package/python-schedule/python-schedule.hash
index 2b2f0489e8..92475f973c 100644
--- a/package/python-schedule/python-schedule.hash
+++ b/package/python-schedule/python-schedule.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/schedule/json, sha256 locally computed
-md5	ab135a73458547d2b836beddd168528b  schedule-0.4.3.tar.gz
-sha256	31a160546a17838842199c792ba267575cf41339ca730aaf060567b798f4f46e  schedule-0.4.3.tar.gz
+md5	53fb2e550b2539264eeceb5d85e82759  schedule-0.5.0.tar.gz
+sha256	1003a07c2dce12828c25a03a611a7371cedfa956e5f1b4abc32bcc94eb5a335b  schedule-0.5.0.tar.gz
 # License file, locally calculated
 sha256	30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
diff --git a/package/python-schedule/python-schedule.mk b/package/python-schedule/python-schedule.mk
index 26a3f5bce1..16612a0881 100644
--- a/package/python-schedule/python-schedule.mk
+++ b/package/python-schedule/python-schedule.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCHEDULE_VERSION = 0.4.3
+PYTHON_SCHEDULE_VERSION = 0.5.0
 PYTHON_SCHEDULE_SOURCE = schedule-$(PYTHON_SCHEDULE_VERSION).tar.gz
-PYTHON_SCHEDULE_SITE = https://pypi.python.org/packages/ee/68/ba6b0bb69b2be13b32983971bca6c5adf22df6321945232e1419bc34a82f
+PYTHON_SCHEDULE_SITE = https://pypi.python.org/packages/fd/31/599a3387c2e98c270d5ac21a1575f3eb60a3712c192a0ca97a494a207739
 PYTHON_SCHEDULE_SETUP_TYPE = setuptools
 PYTHON_SCHEDULE_LICENSE = MIT
 PYTHON_SCHEDULE_LICENSE_FILES = LICENSE.txt
