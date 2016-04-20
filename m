From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Apr 2016 13:40:02 +0200
Subject: [Buildroot] [git commit] python-certifi: bump to version 2016.2.28
Message-ID: <20160420114712.1859181E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfb53d30bf824f5bac36082c118f1af83639b3e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use upstream MD5 checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-certifi/python-certifi.hash | 5 +++--
 package/python-certifi/python-certifi.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 9277f51..ade4db3 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,2 +1,3 @@
-sha1   f53dc8f57aaf6d69c183ebadcec52ece0a55cc3f                         certifi-14.05.14.tar.gz
-sha256 1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69 certifi-14.05.14.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5d672aa766e1f773c75cfeccd02d3650, sha256 locally computed
+md5   5d672aa766e1f773c75cfeccd02d3650  certifi-2016.2.28.tar.gz
+sha256  5e8eccf95924658c97b990b50552addb64f55e1e3dfe4880456ac1f287dc79d0  certifi-2016.2.28.tar.gz
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index f142041..84db8ff 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 14.05.14
+PYTHON_CERTIFI_VERSION = 2016.2.28
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
 PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/source/c/certifi
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
