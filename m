From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:13:53 +0200
Subject: [Buildroot] [git commit] package/msmtp: bump version to 1.8.7
Message-ID: <20200412210109.9B9338E919@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=142b39da706b1ab3c7cd769e1dabd7a6b85cc8a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/marlam/msmtp-mirror/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 9849c547c2..b2aa47cd8f 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.6.tar.xz.sig
-sha256	6625f147430c65ba8527f52c4fe5d4d33552d3c0fb6d793ba7df819a3b3042e1	msmtp-1.8.6.tar.xz
+# https://marlam.de/msmtp/releases/msmtp-1.8.7.tar.xz.sig
+sha256	9a53bcdc244ec5b1a806934ecc7746d9d09db581f587bedf597e9da2f48c51f1	msmtp-1.8.7.tar.xz
 
 # Hash for license file:
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 1518aa10e4..8c260471e6 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.6
+MSMTP_VERSION = 1.8.7
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
