From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Jul 2015 14:40:08 -0300
Subject: [Buildroot] [PATCH 3/4] file: bump to version 5.24
In-Reply-To: <1436550009-30590-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436550009-30590-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436550009-30590-3-git-send-email-gustavo@zacarias.com.ar>
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
index a061783..28f071d 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	2c8ab3ff143e2cdfb5ecee381752f80a79e0b4cfe9ca4cc6e1c3e5ec15e6157c	file-5.23.tar.gz
+sha256	802cb3de2e49e88ef97cdcb52cd507a0f25458112752e398445cea102bc750ce	file-5.24.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 4baa393..f3b09ec 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.23
+FILE_VERSION = 5.24
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
-- 
2.3.6
