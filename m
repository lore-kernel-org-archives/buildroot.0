From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:40:10 +0200
Subject: [Buildroot] [git commit] package/opus: bump version to 1.3.1
Message-ID: <20190415193637.B0888805AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b594e6a1b7af7a5e46d599579523953a3af75726
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a number of post-1.3 fixes.  For details, see the announcement:

http://lists.xiph.org/pipermail/opus/2019-April/004318.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index c916647916..2a94d3723d 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256 4f3d69aefdf2dbaf9825408e452a8a414ffc60494c70633560700398820dc550  opus-1.3.tar.gz
+sha256 65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d  opus-1.3.1.tar.gz
 
 # Hash for license file
 sha256 8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  COPYING
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index b3cfa21fde..f23461a3af 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.3
+OPUS_VERSION = 1.3.1
 OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
