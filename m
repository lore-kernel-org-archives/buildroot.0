From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:17:26 +0100
Subject: [Buildroot] [git commit] package/augeas: bump to version 1.11.0
Message-ID: <20181216201333.678FB8B470@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc53edb9e2fce9c361cc89bf4a6cbcd2208543dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/augeas/augeas.hash | 4 ++--
 package/augeas/augeas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
index 46b99dd8fe..d69ef8577e 100644
--- a/package/augeas/augeas.hash
+++ b/package/augeas/augeas.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://download.augeas.net/augeas-1.10.1.tar.gz.sig
-sha256  52db256afab261d31cc147eaa1a71795a5fec59e888dfd0b65a84c7aacd6364d  augeas-1.10.1.tar.gz
+# http://download.augeas.net/augeas-1.11.0.tar.gz.sig
+sha256  393ce8f4055af89cd4c20bf903eacbbd909cf427891f41b56dc2ba66243ea0b0  augeas-1.11.0.tar.gz
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index c4b8b7e6c2..8cb4f74e41 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUGEAS_VERSION = 1.10.1
+AUGEAS_VERSION = 1.11.0
 AUGEAS_SITE = http://download.augeas.net
 AUGEAS_INSTALL_STAGING = YES
 AUGEAS_LICENSE = LGPL-2.1+
