From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 22:51:08 +0100
Subject: [Buildroot] [git commit] package/iperf: fixed hash to match v2.0.13
 archive
Message-ID: <20190123215314.16255813FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=332d476195357bb2fffe1a38266cf203cc5b9270
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The iperf project changed the archive after the release without changing
the filename of the archive.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iperf/iperf.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 696085c05d..bce46c6919 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1	3eb21c329af811af53a2c816e1ed26b3dd2c259f	iperf-2.0.13.tar.gz
+sha1	0c7625c61087b9e6866421abb8bb533658b40a8d	iperf-2.0.13.tar.gz
 
 # Locally computed:
-sha256  a43ee9d6476955e7fc7aa894b6c4d227a2129943ad6171ad39aa52f1a065db50  iperf-2.0.13.tar.gz
+sha256  c88adec966096a81136dda91b4bd19c27aae06df4d45a7f547a8e50d723778ad  iperf-2.0.13.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
