From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 08:27:16 +0100
Subject: [Buildroot] [git commit] bind: bump to version 9.6-ESV-R10
Message-ID: <20131027073002.533739BBB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33be28d1700a5301e49d916fa1ec7143a1f49df3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 306284b..2e01e8b 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.6-ESV-R9-P1
+BIND_VERSION = 9.6-ESV-R10
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
