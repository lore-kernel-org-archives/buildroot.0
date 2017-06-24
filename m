From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 12:07:56 +0200
Subject: [Buildroot] [git commit] package/nasm: bump version to 2.13.01
Message-ID: <20170624100720.1741C81D7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45943c849e776492d882412b3def56a15ae2e3b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to fix x264 build error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nasm/nasm.hash | 2 +-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index 5d7c36d..b88671c 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4c866b60c0b1c4ebc715205d007b4640ff4e36af637c9a7deb87b2900e544321	nasm-2.12.02.tar.xz
+sha256 aa0213008f0433ecbe07bb628506a5c4be8079be20fc3532a5031fd639db9a5e  nasm-2.13.01.tar.xz
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 8afd320..3e2515e 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.12.02
+NASM_VERSION = 2.13.01
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
