From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Apr 2019 10:46:00 +0200
Subject: [Buildroot] [PATCH 2/2] package/mutt: bump to version 1.11.4
In-Reply-To: <20190414084600.29278-1-fontaine.fabrice@gmail.com>
References: <20190414084600.29278-1-fontaine.fabrice@gmail.com>
Message-ID: <20190414084600.29278-2-fontaine.fabrice@gmail.com>
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
index 476773c294..d0e2d2dd83 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 da5cd4c39f228914d3933d8cf3a017c8271fdd9b9d81c6e4fc42ad22e1a28723  mutt-1.11.2.tar.gz
+sha256 b651357ea6c8762178080493991c77ecb111d916d171d422500257ab48be2801  mutt-1.11.4.tar.gz
 sha256 732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 5860e8430e..613358abdd 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.11.2
+MUTT_VERSION = 1.11.4
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.20.1
