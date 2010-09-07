From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Sep 2010 23:08:40 +0200
Subject: [Buildroot] [git commit master 1/1] openvpn: bump to 2.1.2
Message-ID: <20100907211001.071EC8A4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1e5b49c9c455736bf87fd9f75920c5cfedfca338
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/openvpn/openvpn.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 394bb5f..9e3b2eb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 	Kconfig infrastructure rebased against 2.6.36-rc1, bringing
 	misc fixes + nconfig and savedefconfig targets.
 
-	Updated/fixed packages: busybox, dropbear
+	Updated/fixed packages: busybox, dropbear, openvpn
 
 2010.08: Released August 31th, 2010:
 
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 084ee2f..714938b 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.1.1
+OPENVPN_VERSION = 2.1.2
 OPENVPN_SITE = http://openvpn.net/release
 OPENVPN_CONF_OPT = --enable-small
 
-- 
1.7.1
