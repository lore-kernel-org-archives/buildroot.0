From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Mar 2011 14:39:57 +0100
Subject: [Buildroot] [git commit master 1/1] xz: bump to version 5.0.1
Message-ID: <20110310134139.D6D338A2CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6f7187d11d6246539f2c98f40f6df5556e513f1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xz/xz.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index dfc0638..1d8c7ee 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -3,7 +3,7 @@
 # xz-utils
 #
 #############################################################
-XZ_VERSION = 5.0.0
+XZ_VERSION = 5.0.1
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
-- 
1.7.3.4
