From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 18 Sep 2015 12:07:50 +0100
Subject: [Buildroot] [PATCH 1/3] file: bump to version 5.25
Message-ID: <1442574472-47392-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/file/file.hash |    2 +-
 package/file/file.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 28f071d..2eac7a5 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	802cb3de2e49e88ef97cdcb52cd507a0f25458112752e398445cea102bc750ce	file-5.24.tar.gz
+sha256 3735381563f69fb4239470b8c51b876a80425348b8285a7cded8b61d6b890eca  file-5.25.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index f3b09ec..4d13547 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.24
+FILE_VERSION = 5.25
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
-- 
1.7.1
