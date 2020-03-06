From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  5 Mar 2020 18:23:36 -0700
Subject: [Buildroot] [PATCH 2/2] package/ser2net: bump to version 4.1.6
In-Reply-To: <20200306012336.63370-1-james.hilliard1@gmail.com>
References: <20200306012336.63370-1-james.hilliard1@gmail.com>
Message-ID: <20200306012336.63370-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/cce/ccebd933feddcea2253837b8a0bf1ef96356b4fb/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 5bd927d7d1..d11babec65 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5 44a69f573677d9f2bde87b3611db5817  ser2net-4.1.1.tar.gz
-sha1 502e11c3bee429de6550db459d83c9a0991cfc5c  ser2net-4.1.1.tar.gz
+md5 96498fab618ff23ae2791eefc86a5066  ser2net-4.1.6.tar.gz
+sha1 3b31fbbbdab2c658bb0dc19ed93c7d8474ecdd25  ser2net-4.1.6.tar.gz
 # Locally computed:
-sha256 ad6c8fb34d01be177570323899d840a44c8774399d594595393708162fc61e22  ser2net-4.1.1.tar.gz
+sha256 757505db9afc21a448cb008a3b9a9040cdc17c348ef42a55c9e672d4ccf71e9f  ser2net-4.1.6.tar.gz
 sha256 501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 2ea68ccc43..b438ab26b8 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.1.1
+SER2NET_VERSION = 4.1.6
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.20.1
