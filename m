From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:00:29 +0100
Subject: [Buildroot] [git commit branch/next] whois: bump to version 5.2.2
Message-ID: <20141118220222.4CA84B4922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec52d2b7999b844f2e877dfcf43c43e25d63f895
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/whois/whois.hash |    4 ++--
 package/whois/whois.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 13efa14..858eb94 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,2 @@
-# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.1.dsc
-sha256	54e6b64f16e10bfaf14ac40025b4272090298f0d9d3e62cbadabf946051515e6	whois_5.2.1.tar.xz
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.2.dsc
+sha256	cba874b457a6b7c4659245780d3d7321d129ab47da86103e07578ec7430fec09	whois_5.2.2.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 13c0230..63268c6 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.1
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/w/whois
+WHOIS_VERSION = 5.2.2
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20141112T101048Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
