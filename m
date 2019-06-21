From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Fri, 21 Jun 2019 14:44:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-daemon: bump to version 2.2.3
Message-ID: <1561121063-19216-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/python-daemon/python-daemon.hash | 6 +++---
 package/python-daemon/python-daemon.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-daemon/python-daemon.hash b/package/python-daemon/python-daemon.hash
index 12977b5..5366418 100644
--- a/package/python-daemon/python-daemon.hash
+++ b/package/python-daemon/python-daemon.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=72e2acf2c3d69c7fa75a6625d06adfd0, sha256 locally computed
-md5  72e2acf2c3d69c7fa75a6625d06adfd0  python-daemon-2.1.1.tar.gz
-sha256  58a8c187ee37c3a28913bef00f83240c9ecd4a59dce09a24d92f5c941606689f  python-daemon-2.1.1.tar.gz
+# md5, sha256 https://pypi.org/pypi/python-daemon/json
+md5  3ab10a93472201214cd95c05f1923af6  python-daemon-2.2.3.tar.gz
+sha256  affeca9e5adfce2666a63890af9d6aff79f670f7511899edaddca7f96593cc25  python-daemon-2.2.3.tar.gz
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
index 76820b7..600ccf5 100644
--- a/package/python-daemon/python-daemon.mk
+++ b/package/python-daemon/python-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DAEMON_VERSION = 2.1.1
+PYTHON_DAEMON_VERSION = 2.2.3
 PYTHON_DAEMON_SITE = https://pypi.python.org/packages/source/p/python-daemon
 PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPL-3.0+ (test, build)
 PYTHON_DAEMON_LICENSE_FILES = LICENSE.ASF-2 LICENSE.GPL-3
-- 
2.7.4
