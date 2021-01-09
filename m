From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Jan 2021 16:02:54 +0100
Subject: [Buildroot] [git commit] package/python-s3transfer: bump to version
 0.3.3
Message-ID: <20210109145346.06DDD8258C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cba200c87238286e9338fb73777826e1dbb05cee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, use two spaces for all the hashes.

Signed-off-by: Rapha??l M??lotte <raphael.melotte@essensium.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-s3transfer/python-s3transfer.hash | 6 +++---
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 6b554607da..496acc045c 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5	8ca74015d9dc58af26c68276a8867eca  s3transfer-0.2.1.tar.gz
-sha256	6efc926738a3cd576c2a79725fed9afde92378aa5c6a957e3af010cb019fac9d  s3transfer-0.2.1.tar.gz
+md5  e351d246498fca53e2ca2bf75c550d60  s3transfer-0.3.3.tar.gz
+sha256  921a37e2aefc64145e7b73d50c71bb4f26f46e4c9f414dc648c6245ff92cf7db  s3transfer-0.3.3.tar.gz
 # Locally computed sha256 checksums
-sha256	8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE.txt
+sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 86bdc19eae..946be261a3 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.2.1
+PYTHON_S3TRANSFER_VERSION = 0.3.3
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/39/12/150cd55c606ebca6725683642a8e7068cd6af10f837ce5419a9f16b7fb55
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/50/de/2b688c062107942486c81a739383b1432a72717d9a85a6a1a692f003c70c
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
