From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Dec 2020 21:17:18 +0100
Subject: [Buildroot] [git commit] package/libosip2: bump to version 5.2.0
Message-ID: <20201215200349.8044B870CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc20092aac864c5c064a30ae56338cc60dd227d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://git.savannah.nongnu.org/cgit/osip.git/tree/ChangeLog?h=5.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libosip2/libosip2.hash | 4 ++--
 package/libosip2/libosip2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libosip2/libosip2.hash b/package/libosip2/libosip2.hash
index 76bc29d5fe..400158cd7f 100644
--- a/package/libosip2/libosip2.hash
+++ b/package/libosip2/libosip2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	61bb28317221a630e47f65389d5ff3e4693996d3128e9e0d5d1399e4feebf64d	libosip2-5.1.1.tar.gz
+sha256  4fb48b2ea568bb41c6244b0df2bb7175849ca93e84be53ceb268fdf9351bb375  libosip2-5.2.0.tar.gz
 
 # Hash for license file:
-sha256	8d9e95ed0e48df46dc758eb0d86df611f771eab4eed94bebb77dca87f1c897de	COPYING
+sha256  8d9e95ed0e48df46dc758eb0d86df611f771eab4eed94bebb77dca87f1c897de  COPYING
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index e608f671c8..d28027c135 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSIP2_VERSION = 5.1.1
+LIBOSIP2_VERSION = 5.2.0
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 LIBOSIP2_LICENSE = LGPL-2.1+
