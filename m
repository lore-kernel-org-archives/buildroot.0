From: Felix Vollmer <felixvollmer@gmail.com>
Date: Thu,  4 Jun 2020 23:25:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/asterisk: bump version to 16.10.0
Message-ID: <20200604212509.162415-1-FelixVollmer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release Notes:
https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16-current-summary.html

Signed-off-by: Felix Vollmer <FelixVollmer@gmail.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 26aa4b89b7..50457ba8f5 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  474cbc6f9dddee94616f8af8e097bc4d340dc9698c4165dc45be6e0be80ff725  asterisk-16.6.2.tar.gz
+sha256  f0ba5e3c4ef46f6657dd3a7167190f9b6cd6bbf4af09ecc291a9d5868b477609  asterisk-16.10.0.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index cea287f0d7..97e97c14c8 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.6.2
+ASTERISK_VERSION = 16.10.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.25.1
