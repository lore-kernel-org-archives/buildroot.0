From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Mar 2020 21:53:48 +0100
Subject: [Buildroot] [git commit] package/x264: bump version to 20191217-2245
Message-ID: <20200320204059.567B082AB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c7122549fdc134ce9aa802253581397a3f0102e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index 0cbdc03a9c..93242a46cc 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 88bbb8f7453497be4ee85cbc6f7d27c02822c4a3744b5ae6042c9c0159ad0747  x264-snapshot-20190623-2245.tar.bz2
+sha256 0bb67d095513391e637b3b47e8efc3ba4603c3844f1b4c2690f4d36da7763055  x264-snapshot-20191217-2245.tar.bz2
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index f3654d46b0..9d217d1912 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = 20190623-2245
+X264_VERSION = 20191217-2245
 X264_SITE = http://download.videolan.org/x264/snapshots
 X264_SOURCE = x264-snapshot-$(X264_VERSION).tar.bz2
 X264_LICENSE = GPL-2.0+
