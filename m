From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:18:09 +0100
Subject: [Buildroot] [git commit branch/next] file: bump to version 5.30
Message-ID: <20170215201837.E9E2B82214@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac82e0ebada7efef4d7fbc4ce3de4748808c00b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/file/file.hash | 2 +-
 package/file/file.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 9a4c9f1..3fafff8 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ea661277cd39bf8f063d3a83ee875432cc3680494169f952787e002bdd3884c0  file-5.29.tar.gz
+sha256 694c2432e5240187524c9e7cf1ec6acc77b47a0e19554d34c14773e43dbbf214  file-5.30.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 3309c95..ea0d0ec 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.29
+FILE_VERSION = 5.30
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
