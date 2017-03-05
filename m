From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 12:09:59 +0100
Subject: [Buildroot] [git commit] package/chrony: bump version to 3.1
Message-ID: <20170305111016.4CA5282285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d93676d2f015e51c20d5e1e22f4b94164adeb5aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/chrony/chrony.hash | 6 +++---
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 66ec060..8501808 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,3 +1,3 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2016/11/msg00000.html
-md5  d08dd5a7d79a89891d119adcccb4397d  chrony-2.4.1.tar.gz
-sha1 b412375ca90dbef653ad00534f8b73b825e396d4  chrony-2.4.1.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2017/01/msg00003.html
+md5 f8d2ee78c55548bfbe95582c6a855cee  chrony-3.1.tar.gz
+sha1 564dd010a10fbdcc7c177337115ccffa43fe0f95  chrony-3.1.tar.gz
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 0dca2ee..c3d48a7 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 2.4.1
+CHRONY_VERSION = 3.1
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
