From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 08:40:17 +0100
Subject: [Buildroot] [git commit] bison: bump to version 3.0.4
Message-ID: <20150126074120.2CAD8805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0230c413b422dc1d351b3ef9881091634882e42a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bison/bison.hash |    2 +-
 package/bison/bison.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index dd10086..16913f2 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5940efbdd6b5d80e55ec16a01d2322e2892da21863391049b9b692570649177c	bison-3.0.3.tar.xz
+sha256	a72428c7917bdf9fa93cb8181c971b6e22834125848cf1d03ce10b1bb0716fe1	bison-3.0.4.tar.xz
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 45f785e..76ceb6e 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.0.3
+BISON_VERSION = 3.0.4
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
