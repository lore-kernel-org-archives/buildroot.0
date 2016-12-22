From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Dec 2016 13:32:02 +0200
Subject: [Buildroot] [PATCH] iperf3: bump to version 3.1.4
Message-ID: <32a5ed2fdbbae94398d8fa4b5149edc9f2c980ae.1482406322.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 1accccd04a21..0cac1e3c5156 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,2 +1,2 @@
-# From http://software.es.net/iperf/news.html#security-issue-iperf-3-1-3-iperf-3-0-12-released
-sha256  60d8db69b1d74a64d78566c2317c373a85fef691b8d277737ee5d29f448595bf  iperf-3.1.3.tar.gz
+# From http://software.es.net/iperf/news.html
+sha256  db61d70ac62003ebe0bf15496bd8c4b3c4b728578a44d0a1a88fcf8afc0e8f76  iperf-3.1.4.tar.gz
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 3d2a7086ebd3..7623786ae75e 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.1.3
+IPERF3_VERSION = 3.1.4
 IPERF3_SITE = http://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3c, BSD-2c, MIT
-- 
2.11.0
