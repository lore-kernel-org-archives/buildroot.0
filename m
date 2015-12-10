From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 10 Dec 2015 16:18:27 +0100
Subject: [Buildroot] [PATCH] python-six: bump to 0.10.0
Message-ID: <1449760707-20957-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-six/python-six.hash | 2 +-
 package/python-six/python-six.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-six/python-six.hash b/package/python-six/python-six.hash
index 6121a08..a90c79b 100644
--- a/package/python-six/python-six.hash
+++ b/package/python-six/python-six.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5  six-1.9.0.tar.gz
+sha256  105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a  six-1.10.0.tar.gz
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 24fd976..0edefe3 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SIX_VERSION = 1.9.0
+PYTHON_SIX_VERSION = 1.10.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
 PYTHON_SIX_SITE = https://pypi.python.org/packages/source/s/six
 PYTHON_SIX_SETUP_TYPE = setuptools
-- 
2.1.4
