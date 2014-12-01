From: Fabian Mewes <architekt@coding4coffee.org>
Date: Mon,  1 Dec 2014 22:50:11 +0100
Subject: [Buildroot] [PATCH v2] openvpn: CVE-2014-8104: bump to version 2.3.6
In-Reply-To: <547CDED0.9050305@zacarias.com.ar>
References: <547CDED0.9050305@zacarias.com.ar>
Message-ID: <1417470611-27172-1-git-send-email-architekt@coding4coffee.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see
https://community.openvpn.net/openvpn/wiki/SecurityAnnouncement-97597e732b

Signed-off-by: Fabian Mewes <architekt@coding4coffee.org>
---
 package/openvpn/openvpn.hash |    2 +-
 package/openvpn/openvpn.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 4e1911a..38579ab 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7ac286f09ed4981358ce01907993dc29f69b34d3652de2b70ca9b8b2a056b684	openvpn-2.3.5.tar.xz
+sha256	adae2ef34c9225347a844683b88caa87cde0979b7f2390fd1776db0eb51510ed 	openvpn-2.3.6.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e0dba35..d9871ef 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.5
+OPENVPN_VERSION = 2.3.6
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
-- 
1.7.10.4
