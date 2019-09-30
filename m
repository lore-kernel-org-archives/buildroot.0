From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Sep 2019 19:12:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump to version 1.12.2
Message-ID: <20190930171242.4776-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 376fd8215c..d4b7a70cad 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 01c565406ec4ffa85db90b45ece2260b25fac3646cc063bbc20a242c6ed4210c  mutt-1.12.1.tar.gz
+sha256 bc42750ce8237742b9382f2148fc547a8d8601aa4a7cd28c55fe7ca045196882  mutt-1.12.2.tar.gz
 sha256 732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 6a52106abc..40212631cc 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.12.1
+MUTT_VERSION = 1.12.2
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.23.0
