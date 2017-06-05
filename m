From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 12:51:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/iperf3: bump version to 3.1.7
Message-ID: <20170605105126.27191-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iperf3/iperf3.hash | 2 +-
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index e43210b71..3e34f98eb 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,2 +1,2 @@
 # From http://software.es.net/iperf/news.html
-sha256   6e1a6200cd38baeab58ef0d7b8769e7aa6410c3a3168e65ea8277a4de79e5500 iperf-3.1.5.tar.gz
+sha256 a4ef73406fe92250602b8da2ae89ec53211f805df97a1d1d629db5a14043734f  iperf-3.1.7.tar.gz
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index b07cd21aa..cc4e72427 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.1.5
+IPERF3_VERSION = 3.1.7
 IPERF3_SITE = http://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.11.0
