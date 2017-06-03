From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 19:41:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/gesftpserver: security bump to
	version 0.2.2
Message-ID: <20170603174150.9409-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details refer to
http://www.chiark.greenend.org.uk/pipermail/sgo-software-announce/2016/000035.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gesftpserver/gesftpserver.hash | 2 +-
 package/gesftpserver/gesftpserver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gesftpserver/gesftpserver.hash b/package/gesftpserver/gesftpserver.hash
index b4c9fdf52..1a8a5f349 100644
--- a/package/gesftpserver/gesftpserver.hash
+++ b/package/gesftpserver/gesftpserver.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5f744c38df9bb82f5ab500858a0fb4767ac3ee2254301da03cbcf8e6c587cbf5	sftpserver-0.2.1.tar.gz
+sha256 8ac1938d0f62a05799b2aeab489d6ce098c3fe53280a9b66c0957b1fdcbcbab9  sftpserver-0.2.2.tar.gz
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 27a1ec38b..58c6270a0 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GESFTPSERVER_VERSION = 0.2.1
+GESFTPSERVER_VERSION = 0.2.2
 GESFTPSERVER_SOURCE = sftpserver-$(GESFTPSERVER_VERSION).tar.gz
 GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver
 GESFTPSERVER_LICENSE = GPL-2.0+
-- 
2.11.0
