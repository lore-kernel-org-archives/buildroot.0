From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jan 2017 13:55:51 +0100
Subject: [Buildroot] [git commit] iperf3: bump to version 3.1.5
Message-ID: <20170121125742.C1E2581916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb6bb34115fc460035dce452402d4dde3ad3a328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iperf3/iperf3.hash | 2 +-
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 0cac1e3..e43210b 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,2 +1,2 @@
 # From http://software.es.net/iperf/news.html
-sha256  db61d70ac62003ebe0bf15496bd8c4b3c4b728578a44d0a1a88fcf8afc0e8f76  iperf-3.1.4.tar.gz
+sha256   6e1a6200cd38baeab58ef0d7b8769e7aa6410c3a3168e65ea8277a4de79e5500 iperf-3.1.5.tar.gz
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 7623786..909c104 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.1.4
+IPERF3_VERSION = 3.1.5
 IPERF3_SITE = http://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3c, BSD-2c, MIT
