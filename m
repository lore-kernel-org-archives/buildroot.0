From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Dec 2014 09:30:54 -0300
Subject: [Buildroot] [PATCH] file: bump to version 5.21
Message-ID: <1418301054-25393-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/file/file.hash | 2 +-
 package/file/file.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 1043d74..9487853 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5bc36bfbb83a009da25a7174848f1bc5824be03192a8fdce7f83dc897ed2d247	file-5.20.tar.gz
+sha256	1a48741d3923c4cc73267109b8a396c0ce3aebe004181f3efb1b0a228d230bb6	file-5.21.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 603e510..b5f30da 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.20
+FILE_VERSION = 5.21
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
-- 
2.0.4
