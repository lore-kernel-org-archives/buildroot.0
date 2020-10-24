From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:57:33 +0200
Subject: [Buildroot] [git commit] package/iperf3: bump to version 3.9
Message-ID: <20201024204612.13E108145E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70fe20867b50736e1e7d04fab76e36a24a29ed25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 5f1c200f55..fa9d54f404 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.8.1.tar.gz.sha256
-sha256	e5b080f3273a8a715a4100f13826ac2ca31cc7b1315925631b2ecf64957ded96  iperf-3.8.1.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.9.tar.gz.sha256
+sha256	24b63a26382325f759f11d421779a937b63ca1bc17c44587d2fcfedab60ac038  iperf-3.9.tar.gz
 # Locally computed
 sha256	9ef73096bdd5209dd979bfa1fec70aeb42a7255d2df3aec423642aa92d5e9f40  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 7d5a10cdef..f67fa17022 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.8.1
+IPERF3_VERSION = 3.9
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
