From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 16:40:10 +0200
Subject: [Buildroot] [git commit] bind: bump to version 9.9.5-p1
Message-ID: <20140625151003.5AD349D096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee6e435f1b603b36ebf49d1ef4e4c91aa02e38c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes runtime issues when built with gcc 4.9

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0a611ea..d6707d2 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.5
+BIND_VERSION = 9.9.5-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
