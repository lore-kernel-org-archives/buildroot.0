From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 28 Oct 2015 01:47:56 +0100
Subject: [Buildroot] [PATCH 1/1] python-networkmanager: bump to version 1.0.1
Message-ID: <1445993276-23276-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/python-networkmanager/python-networkmanager.hash | 6 +++---
 package/python-networkmanager/python-networkmanager.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
index 1438daa..00d31d0 100644
--- a/package/python-networkmanager/python-networkmanager.hash
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=fbae1f2b0140c560222fed95a259753d, sha256 locally computed
-md5	fbae1f2b0140c560222fed95a259753d  python-networkmanager-0.9.13.tar.gz
-sha256	9a61abded027b723ff929196180dc5ea3b4c17182863837d0b88d6a58fd03ea3  python-networkmanager-0.9.13.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=d7f0337b8e58c193c574ceae984cc65f, sha256 locally computed
+md5	d7f0337b8e58c193c574ceae984cc65f  python-networkmanager-1.0.1.tar.gz
+sha256	6eb4073a0d6572fe0bba8cbfe8423f6a8a51c4504a33e0eb4f1b1eadf54c4cee  python-networkmanager-1.0.1.tar.gz
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index b3b1e67..04a2702 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NETWORKMANAGER_VERSION = 0.9.13
+PYTHON_NETWORKMANAGER_VERSION = 1.0.1
 PYTHON_NETWORKMANAGER_SITE = http://pypi.python.org/packages/source/p/python-networkmanager
 PYTHON_NETWORKMANAGER_SETUP_TYPE = distutils
 PYTHON_NETWORKMANAGER_LICENSE = GPLv3+
-- 
1.8.0
