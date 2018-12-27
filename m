From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 17:14:28 +0100
Subject: [Buildroot] [git commit] package/python3: bump to version 3.7.2
Message-ID: <20181227160958.658D583A69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c7d476727c279bb6b3a11d8fb62ddcf5f6ceeb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 7cd9d750a7..5a525130db 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-371/
-md5		0a57e9022c07fad3dadb2eef58568edb Python-3.7.1.tar.xz
+# From https://www.python.org/downloads/release/python-372/
+md5		df6ec36011808205beda239c72f947cb Python-3.7.2.tar.xz
 # Locally computed
-sha256 fa7e2b8e8c9402f192ad56dc4f814089d1c4466c97d780f5e5acc02c04243d6d Python-3.7.1.tar.xz
+sha256 d83fe8ce51b1bb48bbcf0550fd265b9a75cdfdfa93f916f9e700aef8444bf1bb Python-3.7.2.tar.xz
 sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2 LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8fbb95b9ad..ef2c4857d8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.7
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
