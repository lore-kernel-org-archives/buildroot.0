From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:24:18 +0200
Subject: [Buildroot] [git commit] spice-protocol: bump to version 0.12.10
Message-ID: <20151014202428.CCFE0805F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1f384cea96d3a36b141773e659a6df8c2e41c0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/spice-protocol/spice-protocol.hash |    4 ++--
 package/spice-protocol/spice-protocol.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spice-protocol/spice-protocol.hash b/package/spice-protocol/spice-protocol.hash
index 2e88855..c75c095 100644
--- a/package/spice-protocol/spice-protocol.hash
+++ b/package/spice-protocol/spice-protocol.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	9d4745602eb2ab1d1c1ab98b4babf587574870993b4faefe354ac57bb5e8259b	spice-protocol-0.12.6.tar.bz2
+# Locally calculated after checking pgp signature
+sha256	788f0d7195bec5b14371732b562eb55ca82712aab12273b0e87529fb30532efb	spice-protocol-0.12.10.tar.bz2
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index 6762ff0..4e81e6c 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_PROTOCOL_VERSION = 0.12.6
+SPICE_PROTOCOL_VERSION = 0.12.10
 SPICE_PROTOCOL_SOURCE = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
 SPICE_PROTOCOL_SITE = http://www.spice-space.org/download/releases
 SPICE_PROTOCOL_LICENSE = BSD-3c
