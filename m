From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 16:18:41 +0200
Subject: [Buildroot] [git commit] package/x264: bump version
Message-ID: <20180411141843.0CF4C88422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39b6532555a935209e63128a143d00daa5c636e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x264/x264.hash | 3 ++-
 package/x264/x264.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index f0e9f1b827..920f3b74eb 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 986863122b0b3ac2c1fa27c6e3932c3490b84287335fa162bca020aa815aa695  x264-ba24899b0bf23345921da022f7a51e0c57dbe73d.tar.gz
+sha256 cdae4489e0306938a46429824aa3511e7ec2a43f71fee8b4aa46ceea46d15888  x264-7d0ff22e8c96de126be9d3de4952edd6d1b75a8c.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index e14077a2f4..f2fb10c41c 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = ba24899b0bf23345921da022f7a51e0c57dbe73d
+X264_VERSION = 7d0ff22e8c96de126be9d3de4952edd6d1b75a8c
 X264_SITE = git://git.videolan.org/x264.git
 X264_LICENSE = GPL-2.0+
 X264_DEPENDENCIES = host-pkgconf
