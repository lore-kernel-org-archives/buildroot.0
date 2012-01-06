From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Jan 2012 11:05:29 +0100
Subject: [Buildroot] [git commit] openvpn: bump to version 2.2.2
Message-ID: <20120106101009.0690C90018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99befa6d000c0ec9812f486a6537a1b6781625cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openvpn/openvpn.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 587368b..bcb121d 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.2.1
+OPENVPN_VERSION = 2.2.2
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_CONF_OPT = --enable-small --disable-plugins
 
