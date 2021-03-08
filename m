From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon,  8 Mar 2021 18:30:00 +0100
Subject: [Buildroot] [PATCH] package/python-bluezero: bump to version 0.6.0
Message-ID: <20210308173003.381108-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-bluezero/python-bluezero.hash | 4 ++--
 package/python-bluezero/python-bluezero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index d0df83c4c6..59e8c5af5b 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5  4004c165f762029c2139f31c269a7531  bluezero-0.5.0.tar.gz
-sha256  d9562a2d107abc918ffdabd4646039c15c54ca1fca0cec91aa45ba6135d2d0b1  bluezero-0.5.0.tar.gz
+md5  b26e6425d8adc4613b7cdf1d131f8c0b  bluezero-0.6.0.tar.gz
+sha256  d94f0672b1de3ff0040801538143fe9a42c501d8db79bcd183c9e051b8da83bc  bluezero-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 27e11efc14..7e244fe3f0 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.5.0
+PYTHON_BLUEZERO_VERSION = 0.6.0
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/90/63/67c56cebe6f741b190f047531810911cfb528e9c0ec6db8d4c911808ba32
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/be/15/4a806580ffd359a03184776f37cf201298918f302b414b8a3e594d1be65c
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
-- 
2.27.0
