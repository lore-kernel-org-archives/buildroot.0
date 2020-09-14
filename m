From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Sep 2020 19:52:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump to version 1.14.7
Message-ID: <20200914175228.3418194-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bug-fix release, fixing a variety of small issues.

https://gitlab.com/muttmua/mutt/raw/stable/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index e3007370a4..23e5dd0ff1 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  47972a0152b81b9f67ff322a0a6682b914c15545bfdeac6bcc2f2c0bf9361844  mutt-1.14.6.tar.gz
+sha256  e4f507b133253cb5eef27996b8668956cdf9caac622cf8adad13f0f9a4eda864  mutt-1.14.7.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 6c85202fc0..0ff03724c1 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.14.6
+MUTT_VERSION = 1.14.7
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.28.0
