From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:08:44 +0200
Subject: [Buildroot] [git commit] lftp: bump version to 4.7.3
Message-ID: <20160718211127.CCF9881E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4d8a3f3ff94d520e91a801a358686bdb666a732
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lftp/lftp.hash | 2 +-
 package/lftp/lftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index 3185fc5..57a5205 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 475d7699b1390f951efee867ba1ad600f78329e13fd2a04d92f82bfffb70d872  lftp-4.7.2.tar.xz
+sha256 3b22259cdc4c1a6ae349057d16bda4b4816929e04d223242ab8927bc31a48e7c  lftp-4.7.3.tar.xz
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index c3c11c5..eab7731 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.7.2
+LFTP_VERSION = 4.7.3
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
