From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:02:44 +0200
Subject: [Buildroot] [git commit] strongswan: security bump to version 5.0.4
Message-ID: <20130731160445.CF8749AF60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddbae621247ace20d8db168b3e9faba53322f0dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-2944.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strongswan/strongswan.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 88d6f94..b75c70d 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.0.2
+STRONGSWAN_VERSION = 5.0.4
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
