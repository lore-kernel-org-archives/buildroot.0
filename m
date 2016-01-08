From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 18:52:44 +0100
Subject: [Buildroot] [git commit] opusfile: bump to version 0.7
Message-ID: <20160108175326.29C5B7FE2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec7fba46c98f240712cb79fb7e6b5a138962ab93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opusfile/opusfile.hash | 2 +-
 package/opusfile/opusfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opusfile/opusfile.hash b/package/opusfile/opusfile.hash
index 1833950..2da4bab 100644
--- a/package/opusfile/opusfile.hash
+++ b/package/opusfile/opusfile.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	2428717b356e139f18ed2fdb5ad990b5654a238907a0058200b39c46a7d03ea6	opusfile-0.6.tar.gz
+sha256	9e2bed13bc729058591a0f1cab2505e8cfd8e7ac460bf10a78bcc3b125e7c301	opusfile-0.7.tar.gz
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 918041d..c8108d3 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUSFILE_VERSION = 0.6
+OPUSFILE_VERSION = 0.7
 OPUSFILE_SITE = http://downloads.xiph.org/releases/opus
 OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
 OPUSFILE_LICENSE = BSD-3c
