From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Date: Thu, 10 Jun 2021 18:10:08 +0200
Subject: [Buildroot] [PATCH v2] package/iperf3: bump to version 3.10.1
Message-ID: <20210610161008.norcnwoe3ej3txav@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update LICENSE hash; copyright year update.

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 package/iperf3/iperf3.hash | 6 +++---
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index fa9d54f404..c96d68cd99 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.9.tar.gz.sha256
-sha256	24b63a26382325f759f11d421779a937b63ca1bc17c44587d2fcfedab60ac038  iperf-3.9.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.10.1.tar.gz.sha256
+sha256  03bc9760cc54a245191d46bfc8edaf8a4750f0e87abca6764486972044d6715a  iperf-3.10.1.tar.gz
 # Locally computed
-sha256	9ef73096bdd5209dd979bfa1fec70aeb42a7255d2df3aec423642aa92d5e9f40  LICENSE
+sha256  0e1cb1921904626f0d3e86cacc0e28333140f0f9957267cff0b9d185645743ed  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 7d20b86e78..8c57c61fce 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.9
+IPERF3_VERSION = 3.10.1
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.25.1
