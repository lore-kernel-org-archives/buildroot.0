From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  3 Oct 2018 15:13:55 +0200
Subject: [Buildroot] [PATCH 1/4] package/asterisk: bump version to 14.7.8
Message-ID: <20181003131358.28002-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index a3e9d10aff..2449aeb4d1 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  249cf223ef4dd7aea01f0d250a6b9cad661ebd78910c73adb7f59c1c46f9fed8  asterisk-14.7.6.tar.gz
+sha256  41c99bd2236af95d056e15f9d044c28b69e00935e67791b18fa70b0614402012  asterisk-14.7.8.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index f31e2394f7..ea779cc8f6 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 14.7.6
+ASTERISK_VERSION = 14.7.8
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.19.0
