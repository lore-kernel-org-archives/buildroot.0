From: Michael Walle <michael@walle.cc>
Date: Tue, 23 Mar 2021 09:46:59 +0100
Subject: [Buildroot] [PATCH] package/rcw-smarc-sal28: bump to version 11
Message-ID: <20210323084659.3199-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the changelog:
* Enable SATA RX lane swap
* Add workaround for A-010554 (Improve SATA hard drive detection)
* Add workaround for A-009531 (Wrong IDO bit value for PCIe completion
  packets)

Signed-off-by: Michael Walle <michael@walle.cc>
---
 package/rcw-smarc-sal28/rcw-smarc-sal28.hash | 2 +-
 package/rcw-smarc-sal28/rcw-smarc-sal28.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rcw-smarc-sal28/rcw-smarc-sal28.hash b/package/rcw-smarc-sal28/rcw-smarc-sal28.hash
index 1f9b42c0ba..6ca5df77cd 100644
--- a/package/rcw-smarc-sal28/rcw-smarc-sal28.hash
+++ b/package/rcw-smarc-sal28/rcw-smarc-sal28.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256	8e53dfceeb7f15d9e890dd4f69db505727276185f7438a5034616d392ff8f223  rcw-smarc-sal28-10.tar.gz
+sha256	8c1c3e26407141ee8d8bd16a43c16c0459b01a60e6e25ca47e22c7499b3e4e65  rcw-smarc-sal28-11.tar.gz
 sha256	803c65088eed36a6697ca9f03f4379bbad24e276dc8da7fef5eb4dc4008415a1  COPYING
diff --git a/package/rcw-smarc-sal28/rcw-smarc-sal28.mk b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
index 0dce543811..4928f1a7f8 100644
--- a/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
+++ b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RCW_SMARC_SAL28_VERSION = 10
+RCW_SMARC_SAL28_VERSION = 11
 RCW_SMARC_SAL28_SITE = $(call github,kontron,rcw-smarc-sal28,v$(RCW_SMARC_SAL28_VERSION))
 RCW_SMARC_SAL28_LICENSE = BSD-2-Clause
 RCW_SMARC_SAL28_LICENSE_FILES = COPYING
-- 
2.20.1
