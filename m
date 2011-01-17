From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 22:27:41 +0100
Subject: [Buildroot] [git commit master 1/1] openvpn: bump to version 2.1.4
Message-ID: <20110117214924.94F028A3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5635902e8865b239dce255be38d7b9cffe8fc1a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openvpn/openvpn.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index ba91690..89118b1 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.1.3
-OPENVPN_SITE = http://openvpn.net/release
+OPENVPN_VERSION = 2.1.4
+OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_CONF_OPT = --enable-small
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
1.7.3.4
