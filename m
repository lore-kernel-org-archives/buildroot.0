From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Fri, 28 Apr 2017 07:28:28 +0000
Subject: [Buildroot] [PATCH 1/1] openocd: bump to 0.10.0
Message-ID: <1493364505-17299-1-git-send-email-christophe.priouzeau@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update openocd to 0.10.0

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 package/openocd/openocd.hash | 6 +++---
 package/openocd/openocd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
index 4ca11e2..b36c816 100644
--- a/package/openocd/openocd.hash
+++ b/package/openocd/openocd.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/openocd/files/openocd/0.9.0/
-sha1 bcf99bb21f09513065b2c9ece148ace7d16cdd0c openocd-0.9.0.tar.bz2
-md5 665cc98ae9e7297e09ec6ac7235fee49 openocd-0.9.0.tar.bz2
+# From http://sourceforge.net/projects/openocd/files/openocd/0.10.0/
+sha1 3245d43d60a1a93f8b0f6b1ce20b53e38cab7a4a  openocd-0.10.0.tar.bz2
+md5 b412bdef0481a3859c6585eb69f6f6ba  openocd-0.10.0.tar.bz2
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 911d311..7c76c59 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENOCD_VERSION = 0.9.0
+OPENOCD_VERSION = 0.10.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
 
-- 
2.7.4
