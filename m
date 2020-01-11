From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 22:39:56 +0100
Subject: [Buildroot] [git commit] package/fio: bump to version 3.17
Message-ID: <20200111213005.32DB28B378@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9221dd54c2f3947d5a70d67a09bb2db0a67b6d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fio/fio.hash | 2 +-
 package/fio/fio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 2950fe70c0..4b6c9b8c1d 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 988ba0ed7488968fdccc882ceadd2124370825d0a1317ae4fdd80d5f2acc31da  fio-3.16.tar.gz
+sha256 2aa68326266ef074ecc0892ebfe165e28c981282f345ee05f9d06f11ada3f052  fio-3.17.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 357d0931a3..5761d1c282 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.16
+FIO_VERSION = 3.17
 FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
