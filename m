From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:06:38 +0200
Subject: [Buildroot] [git commit] package/glorytun: bump version to 0.3.4
Message-ID: <20200417195248.A822D8EF7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65d3813d510e548b556824db7bcd9a1b8f8aff81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the license file has changed due to year update:

-Copyright (c) 2015-2019, Adrien Gallou??t <adrien@gallouet.fr>
+Copyright (c) 2015-2020, Adrien Gallou??t <adrien@gallouet.fr>

Signed-off-by: Adrien Gallou??t <adrien@gallouet.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glorytun/glorytun.hash | 4 ++--
 package/glorytun/glorytun.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glorytun/glorytun.hash b/package/glorytun/glorytun.hash
index 30e8fd34ae..9d1b797787 100644
--- a/package/glorytun/glorytun.hash
+++ b/package/glorytun/glorytun.hash
@@ -1,2 +1,2 @@
-sha256 457552232c72d5fec7ba46382784685c2e8167d49d8182ab3afbfb2b0bce1b01  glorytun-0.2.2.tar.gz
-sha256 02e492aa724ce3a64800ed9429cbabf811935ad1be95d667fae9187baa94e359  LICENSE
+sha256 137d9c525a05bb605163df0465367d36e943715ca773ce43d5ea66f0597600a3  glorytun-0.3.4.tar.gz
+sha256 3d9ddddb8807c305287d9dbab58473e5307e9c91651c43c654a0828855d2b373  LICENSE
diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
index 9207388d7e..d128ae835d 100644
--- a/package/glorytun/glorytun.mk
+++ b/package/glorytun/glorytun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLORYTUN_VERSION = 0.2.2
+GLORYTUN_VERSION = 0.3.4
 GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
 GLORYTUN_DEPENDENCIES = libsodium host-pkgconf
 GLORYTUN_LICENSE = BSD-2-clause
