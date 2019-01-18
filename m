From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 09:22:58 +0100
Subject: [Buildroot] [PATCH] package/asterisk: bump version to 16.1.1
Message-ID: <20190118082259.6513-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a regression introduced in 16.1.0:
https://issues.asterisk.org/jira/browse/ASTERISK-28222

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 557660f0cf..e126372f57 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  97e1bae8e9034cb2a8bc0d4d5bcc9dee4ffe4c6c57ed40b8825be79266fcac50  asterisk-16.1.0.tar.gz
+sha256  d74ba84ad92cd710eb071940e6057ef644d71864431d91aaafe0717a8939afc3  asterisk-16.1.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 90f415647e..3b4d97a258 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.1.0
+ASTERISK_VERSION = 16.1.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.11.0
