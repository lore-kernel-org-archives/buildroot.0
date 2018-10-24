From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:23:19 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] spice-protocol: bump
 version to 0.12.14
Message-ID: <20181024122206.831E388956@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13ea5c877ff5e0c1dfa2c5b0bcba8202c1f9a064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Needed by spice 0.14.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit de8a4b747fb82f4a260d7d0451eaf99dfc745bc4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spice-protocol/spice-protocol.hash | 2 +-
 package/spice-protocol/spice-protocol.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spice-protocol/spice-protocol.hash b/package/spice-protocol/spice-protocol.hash
index c75c095cbf..e72bb2d712 100644
--- a/package/spice-protocol/spice-protocol.hash
+++ b/package/spice-protocol/spice-protocol.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	788f0d7195bec5b14371732b562eb55ca82712aab12273b0e87529fb30532efb	spice-protocol-0.12.10.tar.bz2
+sha256	20350bc4309039fdf0d29ee4fd0033cde27bccf33501e13b3c1befafde9d0c9c	spice-protocol-0.12.14.tar.bz2
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index dcc6feeb13..7392e9533d 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_PROTOCOL_VERSION = 0.12.10
+SPICE_PROTOCOL_VERSION = 0.12.14
 SPICE_PROTOCOL_SOURCE = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
 SPICE_PROTOCOL_SITE = http://www.spice-space.org/download/releases
 SPICE_PROTOCOL_LICENSE = BSD-3-Clause
