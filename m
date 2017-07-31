From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:20:27 +0200
Subject: [Buildroot] [git commit] package/lftp: bump version to 4.8.0
Message-ID: <20170731191623.CFD617FA57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c556279e5d3d2b22bb28fba72f017d537e8eb5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lftp/lftp.hash | 4 +++-
 package/lftp/lftp.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index 0e0f927..99dd994 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,2 +1,4 @@
+# From http://lftp.yar.ru/ftp/lftp-4.8.0.md5sum
+md5 468558412ad3575ef8e98547c41339f4  lftp-4.8.0.tar.xz
 # Locally calculated after checking gpg signature
-sha256 bf67c4d128b6f769a4082947376a9679c5ee3463a24ab761a0757f75d70bd92c  lftp-4.7.4.tar.xz
+sha256 7a2880968088b4aeec43b6b6680fef0e065e1dddcce9b409390157e9766b690f  lftp-4.8.0.tar.xz
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index e658d59..de4ebb8 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.7.4
+LFTP_VERSION = 4.8.0
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
