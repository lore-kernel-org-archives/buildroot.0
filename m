From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Aug 2019 18:47:28 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/asterisk: bump version to
 16.5.0
Message-ID: <20190825164728.8299-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16-current-summary.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index dd1e1db327..588550a000 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8cabb7a6ad2c35b7fb5c520977f2b2c18b471e5b825b65dc411744c6bed2b9f8  asterisk-16.4.1.tar.gz
+sha256  f950da848c387be9e3de24f1d0f4fa7b3924471c382192424dbe0997a5e3a3f7  asterisk-16.5.0.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 53dd593678..cfe50c969c 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.4.1
+ASTERISK_VERSION = 16.5.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.20.1
