From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 15:17:14 +0100
Subject: [Buildroot] [git commit branch/next] tcpdump: bump to version 4.5.1
Message-ID: <20131128141808.8BE519BE11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bea10cc0c8693f3e125ada858278af7f1b91534
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpdump/tcpdump.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index a865e81..0f4cebb 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.4.0
+TCPDUMP_VERSION = 4.5.1
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
