From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Apr 2016 13:41:47 +0200
Subject: [Buildroot] [git commit] iperf3: bump to version 3.1.2
Message-ID: <20160420114712.21AD981E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c63174316ff925491cd82bb456ab78a83b9fc32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iperf3/iperf3.hash | 2 +-
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 4b9332d..48a2b2a 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	86f292e554d42d1bddbd5f587e594005f4ca202c284e4da45ed8cfbe935a5be8	iperf3-3.1.1.tar.gz
+sha256  48b5c783bb4a9c44f2bdcfe52c5d45b77ab1e1c82de3d0131f692457950811f9  iperf3-3.1.2.tar.gz
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 74d6cce..2438955 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.1.1
+IPERF3_VERSION = 3.1.2
 IPERF3_SITE = $(call github,esnet,iperf,$(IPERF3_VERSION))
 IPERF3_LICENSE = BSD-3c, BSD-2c, MIT
 IPERF3_LICENSE_FILES = LICENSE
