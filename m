From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 21:19:14 +0200
Subject: [Buildroot] [git commit] edid-decode: bump to latest version
Message-ID: <20170927191218.CDF8681114@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fd09ff0c60198805b7fad1d5678f26f2a74ae95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version brings bug fixes and improvements.

http://www.spinics.net/lists/linux-media/msg122284.html

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/edid-decode/edid-decode.hash | 2 +-
 package/edid-decode/edid-decode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 0c2c6a2..437dcf4 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ec85b62e863a1ad4636e1a216c122e459d7847c71ff6d57e4bf44406d9cbeb40  edid-decode-681153145d5e05ee15032ea792e967cda06e7622.tar.gz
+sha256 94f43f93285eb5cf8133061295bcdf72b6897bf5372879c2e4032a08d359af12  edid-decode-f56f329ed23a25d002352dedba1e8f092a47286f.tar.gz
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index 243ccfb..a4141b8 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDID_DECODE_VERSION = 681153145d5e05ee15032ea792e967cda06e7622
+EDID_DECODE_VERSION = f56f329ed23a25d002352dedba1e8f092a47286f
 EDID_DECODE_SITE = git://anongit.freedesktop.org/git/xorg/app/edid-decode.git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = edid-decode.c
