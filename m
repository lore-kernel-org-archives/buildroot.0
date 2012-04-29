From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 10:57:58 +0200
Subject: [Buildroot] [git commit] quagga: security bump to version 0.9.20.1
Message-ID: <20120429090502.7657696C08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70a7a6b76d3dee585db13435d5d3e0b2d2cc5d37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 0.9.20.1 to fix CVE-2012-0249, CVE-2012-0250 and
CVE-2012-0255.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
