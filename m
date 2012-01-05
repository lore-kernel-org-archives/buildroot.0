From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 15:26:23 -0300
Subject: [Buildroot] [PATCH 10/10] file: bump to version 5.10
In-Reply-To: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
References: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1325787983-8591-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/file/file.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index 7536056..bb1b6bd 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-FILE_VERSION = 5.09
-FILE_SITE = ftp://ftp.astron.com/pub/file/
+FILE_VERSION = 5.10
+FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
 FILE_INSTALL_STAGING = YES
-- 
1.7.3.4
