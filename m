From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 23:22:47 +0200
Subject: [Buildroot] [git commit] opusfile: bump to version 0.8
Message-ID: <20160714102605.CC97D81F12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e288b3e983c00637218761c5b64b34e15e974e60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opusfile/opusfile.hash | 2 +-
 package/opusfile/opusfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opusfile/opusfile.hash b/package/opusfile/opusfile.hash
index 2da4bab..541a21f 100644
--- a/package/opusfile/opusfile.hash
+++ b/package/opusfile/opusfile.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	9e2bed13bc729058591a0f1cab2505e8cfd8e7ac460bf10a78bcc3b125e7c301	opusfile-0.7.tar.gz
+sha256	2c231ed3cfaa1b3173f52d740e5bbd77d51b9dfecb87014b404917fba4b855a4	opusfile-0.8.tar.gz
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index c8108d3..4c3fb35 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUSFILE_VERSION = 0.7
+OPUSFILE_VERSION = 0.8
 OPUSFILE_SITE = http://downloads.xiph.org/releases/opus
 OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
 OPUSFILE_LICENSE = BSD-3c
