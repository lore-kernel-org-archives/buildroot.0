From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:33:25 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] package/openvpn: security
	bump to version 2.4.4
Message-ID: <20171017090325.D790C7FCDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d942150612bb1b24daeb34460dd99c310bba880
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Fixes CVE-2017-12166:
https://community.openvpn.net/openvpn/wiki/CVE-2017-12166

Changelog:
https://community.openvpn.net/openvpn/wiki/ChangesInOpenvpn24
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit aa070c802ef2556a732ff33e55f17fc0d3444436)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 1db3a31..318f9ed 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256 15e15fc97f189b52aee7c90ec8355aa77469c773125110b4c2f089abecde36fb  openvpn-2.4.3.tar.xz
+sha256 96cd1b8fe1e8cb2920f07c3fd3985faea756e16fdeebd11d3e146d5bd2b04a80  openvpn-2.4.4.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 7cc572e..086f99b 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.3
+OPENVPN_VERSION = 2.4.4
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
