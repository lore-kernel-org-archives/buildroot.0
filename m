From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri,  3 Jul 2015 06:22:12 +0200
Subject: [Buildroot] [PATCH 1/1] python-networkmanager: bump to version
	0.9.13
Message-ID: <1435897332-1858-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/python-networkmanager/python-networkmanager.hash | 4 ++--
 package/python-networkmanager/python-networkmanager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
index 6c6f697..9323336 100644
--- a/package/python-networkmanager/python-networkmanager.hash
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2cd400a7ca4dcd1ea98c864007032494, sha256 locally computed
-md5	2cd400a7ca4dcd1ea98c864007032494  python-networkmanager-0.9.12.tar.gz
-sha256	a4c7bbae8a1ee3cf370ff0cd2ba2e0f1fb7f8e8f99f8f48a1df624c19a11166f  python-networkmanager-0.9.12.tar.gz
+md5	fbae1f2b0140c560222fed95a259753d  python-networkmanager-0.9.13.tar.gz
+sha256 9a61abded027b723ff929196180dc5ea3b4c17182863837d0b88d6a58fd03ea3  python-networkmanager-0.9.13.tar.gz
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index c043edb..b3b1e67 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NETWORKMANAGER_VERSION = 0.9.12
+PYTHON_NETWORKMANAGER_VERSION = 0.9.13
 PYTHON_NETWORKMANAGER_SITE = http://pypi.python.org/packages/source/p/python-networkmanager
 PYTHON_NETWORKMANAGER_SETUP_TYPE = distutils
 PYTHON_NETWORKMANAGER_LICENSE = GPLv3+
-- 
1.8.0
