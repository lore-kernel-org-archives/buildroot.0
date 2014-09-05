From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Sep 2014 13:00:50 +0200
Subject: [Buildroot] [git commit] libpcap: bump to version 1.6.2
Message-ID: <20140905110202.A132A9D5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eae3f383dd17e0f3d93fa6d5cfeaad46a1b956f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpcap/libpcap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 7cf731e..5cd1866 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.6.1
+LIBPCAP_VERSION = 1.6.2
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
