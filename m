From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 22 Jan 2019 12:34:30 -0600
Subject: [Buildroot] [PATCH] package/iperf: bump to 2.0.13
Message-ID: <1548182070-35867-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/iperf/iperf.hash | 5 +++--
 package/iperf/iperf.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 3540c6e..696085c 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,5 +1,6 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1	909b469bbbc38508cd268e334a6ec319c3116f15	iperf-2.0.12.tar.gz
+sha1	3eb21c329af811af53a2c816e1ed26b3dd2c259f	iperf-2.0.13.tar.gz
+
 # Locally computed:
-sha256  367f651fb1264b13f6518e41b8a7e08ce3e41b2a1c80e99ff0347561eed32646  iperf-2.0.12.tar.gz
+sha256  a43ee9d6476955e7fc7aa894b6c4d227a2129943ad6171ad39aa52f1a065db50  iperf-2.0.13.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index c712de6..7088b0f 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.0.12
+IPERF_VERSION = 2.0.13
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
-- 
1.9.1
