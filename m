From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 May 2014 09:24:43 +0200
Subject: [Buildroot] [git commit] openvpn: bump to version 2.3.4
Message-ID: <20140514080153.142FF9CBF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63bf62a4738545466b8e6d3b2b21bd338dae8281
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes TLS version interoperability issues.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index a989ffe..0355678 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.3
+OPENVPN_VERSION = 2.3.4
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
