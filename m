From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:28:43 +0200
Subject: [Buildroot] [git commit] file: bump to version 5.23
Message-ID: <20150612201536.626D980411@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65535dc08aa4612974691708212817885ba3af06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/file/file.hash |    2 +-
 package/file/file.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 8441ba6..a061783 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c4e3a8e44cb888c5e4b476e738503e37fb9de3b25a38c143e214bfc12109fc0b	file-5.22.tar.gz
+sha256	2c8ab3ff143e2cdfb5ecee381752f80a79e0b4cfe9ca4cc6e1c3e5ec15e6157c	file-5.23.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 4b98cbd..4baa393 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.22
+FILE_VERSION = 5.23
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
