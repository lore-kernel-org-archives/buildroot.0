From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Nov 2019 17:44:51 +0100
Subject: [Buildroot] [PATCH v2,
 3/4] package/spice-protocol: bump to version 0.14.0
In-Reply-To: <20191117164452.5361-1-fontaine.fabrice@gmail.com>
References: <20191117164452.5361-1-fontaine.fabrice@gmail.com>
Message-ID: <20191117164452.5361-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- This bump is needed for spice 0.14.2
- Add license hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spice-protocol/spice-protocol.hash | 5 ++++-
 package/spice-protocol/spice-protocol.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/spice-protocol/spice-protocol.hash b/package/spice-protocol/spice-protocol.hash
index e72bb2d712..c23135141a 100644
--- a/package/spice-protocol/spice-protocol.hash
+++ b/package/spice-protocol/spice-protocol.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	20350bc4309039fdf0d29ee4fd0033cde27bccf33501e13b3c1befafde9d0c9c	spice-protocol-0.12.14.tar.bz2
+sha256	b6a4aa1ca32668790b45a494bbd000e9d05797b391d5a5d4b91adf1118216eac	spice-protocol-0.14.0.tar.bz2
+
+# Hash for license file
+sha256	eb55ea746be694c449224c7ddce6340648b075fd377281712a19094e7fb7ef92	COPYING
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index 7392e9533d..f8c55c7b01 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_PROTOCOL_VERSION = 0.12.14
+SPICE_PROTOCOL_VERSION = 0.14.0
 SPICE_PROTOCOL_SOURCE = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
 SPICE_PROTOCOL_SITE = http://www.spice-space.org/download/releases
 SPICE_PROTOCOL_LICENSE = BSD-3-Clause
-- 
2.24.0
