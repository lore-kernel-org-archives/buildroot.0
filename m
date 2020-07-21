From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 09:31:45 +0200
Subject: [Buildroot] [git commit] package/python3: security bump version to
 3.8.5
Message-ID: <20200721072745.BFA9C87B4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c81f492aa55d7abb4a99c459ee2aeb5124398e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2020-15801 & CVE-2019-20907.

Changelog:
https://docs.python.org/release/3.8.5/whatsnew/changelog.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 2ca3f5a335..0a08d04b3f 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-384/
-md5  e16df33cd7b58702e57e137f8f5d13e7  Python-3.8.4.tar.xz
+# From https://www.python.org/downloads/release/python-385/
+md5  35b5a3d0254c1c59be9736373d429db7  Python-3.8.5.tar.xz
 # Locally computed
-sha256  5f41968a95afe9bc12192d7e6861aab31e80a46c46fa59d3d837def6a4cd4d37  Python-3.8.4.tar.xz
+sha256  e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af66a83b0  Python-3.8.5.tar.xz
 sha256  de4d1f2d2ad5ad0cfd1657a106476b31cb5db5ef9d1ff842b237c0c81f0c8a23  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b79d320cbf..31e7ca3d3a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.8
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
