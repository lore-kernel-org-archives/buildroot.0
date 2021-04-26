From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 14:38:16 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/gstreamer1/gst1-interpipe: bump version to 1.1.4
Message-ID: <20210426125912.49B7A86340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa81de1bd1908502018a45959fea562f0d7a971b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Changelog:

  - fix for memory leak in set of listen-to property

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 99362e8d17cfba6e827933e3486d7465e5d10066)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index 32a24dc2a5..124a2e4073 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  48ad146a57f3543b8c32985b042558bf1fe67abeac9532105ebde0b441564cba  gst1-interpipe-v1.1.3-br1.tar.gz
+sha256  2fd86aebfe03849a19e9d02db3a8f97bf6f77de835d36ae84282d6f734df323c  gst1-interpipe-1.1.4-br1.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index cc4bc6e948..eb1e6dd533 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_INTERPIPE_VERSION = v1.1.3
+GST1_INTERPIPE_VERSION = 1.1.4
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
