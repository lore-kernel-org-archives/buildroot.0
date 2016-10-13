From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 08:05:38 +0200
Subject: [Buildroot] [git commit] dhcpcd: bump to version 6.11.5
Message-ID: <20161013060802.565B282269@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2dbdb8a32dc0dab05fc7ff1026dc481a6c91fa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.hash | 2 +-
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 2e74ecc..3be3f7f 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	5c823d607ed1d7513d16ec51c54e21657f1324899e0ba333a497682d88a8c6ee	dhcpcd-6.11.1.tar.xz
+sha256	6f9674dc7e27e936cc787175404a6171618675ecfb6903ab9887b1b66a87d69e	dhcpcd-6.11.5.tar.xz
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 59abaa5..2d446fb 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.11.1
+DHCPCD_VERSION = 6.11.5
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
