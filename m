From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 3 Jul 2015 09:04:46 +0200
Subject: [Buildroot] [git commit] python-networkmanager: bump to version
	0.9.13
Message-ID: <20150703071550.052DC818DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=558caf4e05b06dcbdd209da9a69192c41785ea28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix upstream hash link]
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../python-networkmanager.hash                     |    6 +++---
 .../python-networkmanager/python-networkmanager.mk |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
index 6c6f697..1438daa 100644
--- a/package/python-networkmanager/python-networkmanager.hash
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2cd400a7ca4dcd1ea98c864007032494, sha256 locally computed
-md5	2cd400a7ca4dcd1ea98c864007032494  python-networkmanager-0.9.12.tar.gz
-sha256	a4c7bbae8a1ee3cf370ff0cd2ba2e0f1fb7f8e8f99f8f48a1df624c19a11166f  python-networkmanager-0.9.12.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=fbae1f2b0140c560222fed95a259753d, sha256 locally computed
+md5	fbae1f2b0140c560222fed95a259753d  python-networkmanager-0.9.13.tar.gz
+sha256	9a61abded027b723ff929196180dc5ea3b4c17182863837d0b88d6a58fd03ea3  python-networkmanager-0.9.13.tar.gz
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
