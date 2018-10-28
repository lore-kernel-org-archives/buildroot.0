From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Oct 2018 08:11:32 +0100
Subject: [Buildroot] [git commit] python3: bump to version 3.7.1
Message-ID: <20181028071412.E9BBB82BDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=658ebd8d23139610aef5578c0496ec316fe99396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 9138ad6b9c..7cd9d750a7 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-370/
-md5		eb8c2a6b1447d50813c02714af4681f3 Python-3.7.0.tar.xz
+# From https://www.python.org/downloads/release/python-371/
+md5		0a57e9022c07fad3dadb2eef58568edb Python-3.7.1.tar.xz
 # Locally computed
-sha256 0382996d1ee6aafe59763426cf0139ffebe36984474d0ec4126dd1c40a8b3549 Python-3.7.0.tar.xz
+sha256 fa7e2b8e8c9402f192ad56dc4f814089d1c4466c97d780f5e5acc02c04243d6d Python-3.7.1.tar.xz
 sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2 LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index cd01cf1ac3..8fbb95b9ad 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.7
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
