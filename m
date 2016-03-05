From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Mar 2016 11:40:28 +0100
Subject: [Buildroot] [PATCH 2/4] package/transmission: bump version to 2.90
In-Reply-To: <1457174430-30849-1-git-send-email-bernd.kuhls@t-online.de>
References: <1457174430-30849-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1457174430-30849-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 4199b37..0dc816d 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a9fc1936b4ee414acc732ada04e84339d6755cd0d097bcbd11ba2cfc540db9eb	transmission-2.84.tar.xz
+sha256	69ff8caf81684155926f437f46bf7df1b1fb304f52c7809f546257e8923f2fd2	transmission-2.90.tar.xz
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index efc00a1..6aecf60 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.84
+TRANSMISSION_VERSION = 2.90
 TRANSMISSION_SITE = http://download.transmissionbt.com/files
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
-- 
2.7.0
