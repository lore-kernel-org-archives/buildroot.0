From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 21:35:10 +0100
Subject: [Buildroot] [git commit] file: bump to version 5.22
Message-ID: <20150103203557.2E6F37FCC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb9a1fcb9b17c54e50f8b572e002271bb6175124
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/file/file.hash |    2 +-
 package/file/file.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 9487853..8441ba6 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	1a48741d3923c4cc73267109b8a396c0ce3aebe004181f3efb1b0a228d230bb6	file-5.21.tar.gz
+sha256	c4e3a8e44cb888c5e4b476e738503e37fb9de3b25a38c143e214bfc12109fc0b	file-5.22.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index b5f30da..4b98cbd 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.21
+FILE_VERSION = 5.22
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
