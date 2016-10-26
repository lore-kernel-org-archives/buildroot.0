From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 12:29:29 +0200
Subject: [Buildroot] [git commit] file: bump version to 5.29
Message-ID: <20161026103026.E24EB81E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f63b2a4e9c1807c787c648cc7cdb0fd9fcc9dfe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/file/file.hash | 2 +-
 package/file/file.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 21067b5..9a4c9f1 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0ecb5e146b8655d1fa84159a847ee619fc102575205a0ff9c6cc60fc5ee2e012	file-5.28.tar.gz
+sha256 ea661277cd39bf8f063d3a83ee875432cc3680494169f952787e002bdd3884c0  file-5.29.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 201651c..3309c95 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.28
+FILE_VERSION = 5.29
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
