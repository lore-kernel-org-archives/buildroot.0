From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 22:13:03 +0100
Subject: [Buildroot] [git commit] package/python-hiredis: bump to 1.0.1
Message-ID: <20191202083933.B055780DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2069421e8cf45ba4d33e56c9f534cf04358dbe8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 2ab6766dda..1a013bb3a2 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5	46bc0d51bda994611bae77c044b1398b  hiredis-1.0.0.tar.gz
-sha256	e97c953f08729900a5e740f1760305434d62db9f281ac351108d6c4b5bf51795  hiredis-1.0.0.tar.gz
+md5	ad421ea848734c7be5c10689caa2a6f1  hiredis-1.0.1.tar.gz
+sha256	aa59dd63bb3f736de4fc2d080114429d5d369dfb3265f771778e8349d67a97a4  hiredis-1.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256	70edfa6d3e11f9d7497c2c2f298d06f33b11d10f37f76605102c5ab3b1f28262  COPYING
 sha256	dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 780ec0c13d..435918feb6 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 1.0.0
+PYTHON_HIREDIS_VERSION = 1.0.1
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/9e/e0/c160dbdff032ffe68e4b3c576cba3db22d8ceffc9513ae63368296d1bcc8
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/7f/5c/62e5c6b811b4dcef4125b4a01f76db82c496d79299dd67053b8f9c0732c0
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = COPYING vendor/hiredis/COPYING
