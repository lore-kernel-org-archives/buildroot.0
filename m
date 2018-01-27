From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Jan 2018 23:29:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/transmission: security bump version
 to 2.93
Message-ID: <20180127222953.13741-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-5702:
https://github.com/transmission/transmission/pull/468

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/transmission/transmission.hash | 3 ++-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 849a722d2b..4c1c3f9a3a 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	3a8d045c306ad9acb7bf81126939b9594553a388482efa0ec1bfb67b22acd35f	transmission-2.92.tar.xz
+sha256 8815920e0a4499bcdadbbe89a4115092dab42ce5199f71ff9a926cfd12b9b90b  transmission-2.93.tar.xz
+sha256 20801783bf59e27d03ed6aab625b32a34e221ae95bf801db87827c8023398495  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 7f4675302e..4e78604fdb 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.92
+TRANSMISSION_VERSION = 2.93
 TRANSMISSION_SITE = https://github.com/transmission/transmission-releases/raw/master
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
-- 
2.11.0
