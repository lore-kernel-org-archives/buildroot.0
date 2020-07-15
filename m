From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 23:21:26 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mutt: bump
 version to 1.13.5
Message-ID: <20200715211817.7FB53873BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b99306182082681352781281fcfdbf50e2914103
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Changelog: http://www.mutt.org/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 44090c97e10541ef1570f3e29222b3c1e6536e09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index f0b0153221..f822cfee6e 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 78423016b5f2fcb31bfd156999ff6638177be4459230d2ee61a81e5641d07378  mutt-1.13.3.tar.gz
+sha256 6cd71b5b3e6b255afef6bed3b5e1e8ee9819b3d7c9839fd95e798045882aa653  mutt-1.13.5.tar.gz
 sha256 732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 9cf8304bfe..a71c0e3551 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.13.3
+MUTT_VERSION = 1.13.5
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
