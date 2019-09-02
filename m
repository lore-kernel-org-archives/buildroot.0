From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:12:35 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/dahdi-linux: bump
 to version 3.0.0
Message-ID: <20190902150830.9208E8A2BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af1f97cc6052eb57f6cc34a9df93f47504c7589a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fix build with kernel >= 4.13 thanks to
https://github.com/asterisk/dahdi-linux/commit/d4e232a776ee27eb04aed3cbd72a203118dbe9f1

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11921

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 790c9ca0923e575a3326b6cb14a4eb410352c6c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dahdi-linux/dahdi-linux.hash | 4 ++--
 package/dahdi-linux/dahdi-linux.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dahdi-linux/dahdi-linux.hash b/package/dahdi-linux/dahdi-linux.hash
index c362f8ea3f..1847a4da4c 100644
--- a/package/dahdi-linux/dahdi-linux.hash
+++ b/package/dahdi-linux/dahdi-linux.hash
@@ -1,7 +1,7 @@
 # sha1 from: http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases
 # sha256 locally computed
-sha1    8cbd55b8611c6ed80bcdf84d537566b4934f3def  dahdi-linux-2.11.1.tar.gz
-sha256  f59f382365118205e77d2874f1c0e1546e936247bcc45f07a43bc21778bee9df  dahdi-linux-2.11.1.tar.gz
+sha1    9827f0afc625e293021b81daf94ec054145c975b  dahdi-linux-3.0.0.tar.gz
+sha256  02a8a680d20a3e243f37259edc3554ab9a488595a28562c45c33da3792d12caa  dahdi-linux-3.0.0.tar.gz
 
 # Firmware files have no upstream hash, so sha56 locally computed
 sha256  3ff26cf80555fd7470b43a87c51d03c1db2a75abcd4561d79f69b6c48298e4a1  dahdi-fwload-vpmadt032-1.25.0.tar.gz
diff --git a/package/dahdi-linux/dahdi-linux.mk b/package/dahdi-linux/dahdi-linux.mk
index 6ac1e88943..4d2c7e7177 100644
--- a/package/dahdi-linux/dahdi-linux.mk
+++ b/package/dahdi-linux/dahdi-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAHDI_LINUX_VERSION = 2.11.1
+DAHDI_LINUX_VERSION = 3.0.0
 DAHDI_LINUX_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases
 
 # We need to download all thoe firmware blobs ourselves, otherwise
