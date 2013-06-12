From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Jun 2013 22:29:12 +0200
Subject: [Buildroot] [git commit] openvpn: bump to version 2.3.2
Message-ID: <20130612203717.B0E809AD48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6842cb415d3428432152e6480b7aa840bb591f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openvpn/openvpn.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index db61c83..0756ec4 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.1
+OPENVPN_VERSION = 2.3.2
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_CONF_OPT = --disable-plugin-auth-pam --enable-iproute2
