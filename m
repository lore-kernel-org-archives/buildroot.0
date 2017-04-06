From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:15:48 +0200
Subject: [Buildroot] [git commit] python-pudb: bump to version 2017.1.2
Message-ID: <20170406201552.B44E9822F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0448016ba97aea7f3047e8776909c4a8052e385
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index 4313af0..febf38f 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pudb/json, sha256 locally computed
-md5 4ec3302ef90f22b13c60db16b3557c56 pudb-2017.1.1.tar.gz
-sha256 87117640902c5f602c8517d0167eb5c953a5bdede97975ba29ff17e3d570442c pudb-2017.1.1.tar.gz
+md5 97597d9fec79494a83ec8d55987a8a82 pudb-2017.1.2.tar.gz
+sha256 29d82ed05030146e5f2f9431926cc24f6c6c284cb451a4a850625fc0303e46e7 pudb-2017.1.2.tar.gz
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index e192877..b6b3d53 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2017.1.1
+PYTHON_PUDB_VERSION = 2017.1.2
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://pypi.python.org/packages/3f/ab/a8e103f329460696bb74e3c5cef4060313be3fe0f6fceae866900cb2033c
+PYTHON_PUDB_SITE = https://pypi.python.org/packages/d3/8a/e0fa18cf6f939a63364117546c9bd933add800642004ad40fd5f5bdba0c6
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
