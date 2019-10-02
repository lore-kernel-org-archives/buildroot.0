From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:45:31 +0200
Subject: [Buildroot] [git commit] package/libldns: bump version to 1.7.1
Message-ID: <20191002194115.71D0F881F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5aec4ee9448d7c7afebef31965e7e02937d01165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/NLnetLabs/ldns/blob/release-1.7.1/Changelog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libldns/libldns.hash | 8 ++++----
 package/libldns/libldns.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index f20bb4be59..c8fb39d478 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -1,7 +1,7 @@
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.0.tar.gz.sha1
-sha1 ceeeccf8a27e61a854762737f6ee02f44662c1b8  ldns-1.7.0.tar.gz
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.0.tar.gz.sha256
-sha256 c19f5b1b4fb374cfe34f4845ea11b1e0551ddc67803bd6ddd5d2a20f0997a6cc  ldns-1.7.0.tar.gz
+# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.1.tar.gz.sha1
+sha1 d075a08972c0f573101fb4a6250471daaa53cb3e  ldns-1.7.1.tar.gz
+# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.1.tar.gz.sha256
+sha256 8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229  ldns-1.7.1.tar.gz
 
 # Hash for license file:
 sha256 9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index d3c89bb6b3..75159389de 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLDNS_VERSION = 1.7.0
+LIBLDNS_VERSION = 1.7.1
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
