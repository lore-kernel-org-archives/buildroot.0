From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 11 Jan 2016 12:04:36 +0100
Subject: [Buildroot] [PATCH] python-httplib2: bump to 0.9.2
Message-ID: <1452510276-28799-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-httplib2/python-httplib2.hash | 6 +++---
 package/python-httplib2/python-httplib2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index 6b128d3..879f18b 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=09d8e8016911fc40e2e4c58f1aa3ec24, sha256 locally computed
-md5	09d8e8016911fc40e2e4c58f1aa3ec24  httplib2-0.9.tar.gz
-sha256	39ea8c6a6d9f595c177a16134fc49a990ad8d382758cbf469c8659662f2f51ab  httplib2-0.9.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=bd1b1445b3b2dfa7276b09b1a07b7f0e, sha256 locally computed
+md5	bd1b1445b3b2dfa7276b09b1a07b7f0e  httplib2-0.9.2.tar.gz
+sha256	c3aba1c9539711551f4d83e857b316b5134a1c4ddce98a875b7027be7dd6d988  httplib2-0.9.2.tar.gz
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index ec5c476..adeddd3 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.9
+PYTHON_HTTPLIB2_VERSION = 0.9.2
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
 PYTHON_HTTPLIB2_SITE = http://pypi.python.org/packages/source/h/httplib2
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
-- 
2.1.4
