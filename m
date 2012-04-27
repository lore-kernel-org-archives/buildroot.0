From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Apr 2012 21:26:33 -0300
Subject: [Buildroot] [PATCH] quagga: security bump to version 0.9.20.1
Message-ID: <1335486393-17796-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 0.9.20.1 to fix CVE-2012-0249, CVE-2012-0250 and
CVE-2012-0255.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quagga/quagga.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index bcc3f46..1073852 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,9 +4,8 @@
 #
 #############################################################
 
-QUAGGA_VERSION = 0.99.20
+QUAGGA_VERSION = 0.99.20.1
 QUAGGA_SITE = http://www.quagga.net/download
-
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_CONF_OPT = --program-transform-name='' --enable-netlink
 
-- 
1.7.3.4
