From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 11:53:41 +0200
Subject: [Buildroot] [git commit] package/stella: bump to version 6.1.2
Message-ID: <20200501093915.276B190C2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6d8e4b70be8d8c16ded3b3f9f41a41670618a16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/stella/stella.hash | 2 +-
 package/stella/stella.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index fb7c598a2c..0b50636a00 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  ddf53bb782c63c97c4e5d0fefa9eb256c62e0d5a328c78cc18f06eea45ba7369  stella-6.1.1-src.tar.xz
+sha256  8086e57c231625f0b840ca361f493969247d20476cbb53609d778d37bda17c34  stella-6.1.2-src.tar.xz
 sha256  d207ee9e563fdd062582df8cbb6c8303b9879bd107692c0db2a32477e47dfa35  Copyright.txt
 sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 74c131e72d..53a1050cd8 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.1.1
+STELLA_VERSION = 6.1.2
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
