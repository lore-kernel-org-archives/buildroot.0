From: Martin Bark <martin@barkynet.com>
Date: Mon, 16 May 2016 16:00:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: bump version to
	31d947cf7156cf78d3f57e0bd82b33e6f6ece6b4
Message-ID: <1463410859-7543-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes a fix for static builds using libgcrypt.

Fixes:
 http://autobuild.buildroot.net/results/55a7db5c0cbc34bbf6a2cbc52713d8822deec5b2
 http://autobuild.buildroot.net/results/864d8901eb901182ce186cf9a845636040e242bb
 http://autobuild.buildroot.net/results/aba522aa164267993fb1f1bbc57733be0cbea680

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/iputils/iputils.hash | 2 +-
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 1cd8ed3..42ea5fd 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	73de246aee1fd3cd69b1341a0c4e1b4acfa655fe6f7363fd9424824aa8bf5a57	iputils-3a86a2542c6fe29413c439bebeae11ec8a57ec7c.tar.gz
+sha256	08b9f686fcc874f75b465f90f3e831aa9ac1f2e043f4bb61e6d99868e8869025	iputils-31d947cf7156cf78d3f57e0bd82b33e6f6ece6b4.tar.gz
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 522be9b..18e48b4 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,7 +11,7 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = 3a86a2542c6fe29413c439bebeae11ec8a57ec7c
+IPUTILS_VERSION = 31d947cf7156cf78d3f57e0bd82b33e6f6ece6b4
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPLv2+, BSD-3c, BSD-4c
 # Only includes a license file for BSD
-- 
2.8.2
