From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 11:29:39 +0100
Subject: [Buildroot] [git commit] package/opusfile: bump to version 0.12
Message-ID: <20210131101052.0CA00813B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35ea1dd30c2c926f59a935a4c3be40f7b21e5c8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

also set the indentation to 2 spaces in hash file

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opusfile/opusfile.hash | 4 ++--
 package/opusfile/opusfile.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opusfile/opusfile.hash b/package/opusfile/opusfile.hash
index e9ecf83feb..30bf9b36df 100644
--- a/package/opusfile/opusfile.hash
+++ b/package/opusfile/opusfile.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256 74ce9b6cf4da103133e7b5c95df810ceb7195471e1162ed57af415fabf5603bf  opusfile-0.11.tar.gz
+sha256  118d8601c12dd6a44f52423e68ca9083cc9f2bfe72da7a8c1acb22a80ae3550b  opusfile-0.12.tar.gz
 
 # Hash for license file
-sha256 0267ae795ab744c4e0f9c45e249440fdf2e75dac8c804f36066b28649bf74aaf  COPYING
+sha256  0267ae795ab744c4e0f9c45e249440fdf2e75dac8c804f36066b28649bf74aaf  COPYING
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 49a53b3958..72ae82e801 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUSFILE_VERSION = 0.11
+OPUSFILE_VERSION = 0.12
 OPUSFILE_SITE = https://downloads.xiph.org/releases/opus
 OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
 OPUSFILE_LICENSE = BSD-3-Clause
