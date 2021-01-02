From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 21:21:56 +0100
Subject: [Buildroot] [git commit] package/ortp: bump to version 4.4.8
Message-ID: <20210102200621.DAAC485FD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e94046a9085ebadbe46fcecab5546f784599bd9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ortp/ortp.hash | 2 +-
 package/ortp/ortp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
index 65a5141609..7853c63143 100644
--- a/package/ortp/ortp.hash
+++ b/package/ortp/ortp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  55d12b71ed7c3958abb8d892105e616499d66c88200c46e3ec3cfbbe79771b2e  ortp-4.3.1.tar.gz
+sha256  9b1d43f676a35920e2837abc0eb4d600d4d3e47d2621fa3b0897777cf587ee8d  ortp-4.4.8.tar.gz
 sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index 436e04c14d..67bef9aebb 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORTP_VERSION = 4.3.1
+ORTP_VERSION = 4.4.8
 ORTP_SITE = https://gitlab.linphone.org/BC/public/ortp/-/archive/$(ORTP_VERSION)
 ORTP_LICENSE = GPL-3.0+
 ORTP_LICENSE_FILES = LICENSE.txt
