From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 17:46:28 +0200
Subject: [Buildroot] [git commit] qemu: security bump to 2.12.1
Message-ID: <20181008154556.AC62A8E42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b400c2ae0b06e0be99925a56f1166bed37ff3986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:

This update contains new mitigation functionality for CVE-2018-3639
(Speculative Store Bypass) in x86. There are also bug fixes for
migration, Intel IOMMU emulation, block layer/image handling, ARM
emulation, and various other areas.

https://www.mail-archive.com/qemu-devel at nongnu.org/msg553574.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index fc0b4e87bf..2b27008b73 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256 e69301f361ff65bf5dabd8a19196aeaa5613c1b5ae1678f0823bdf50e7d5c6fc  qemu-2.12.0.tar.xz
+sha256 33583800e0006cd00b78226b85be5a27c8e3b156bed2e60e83ecbeb7b9b8364f  qemu-2.12.1.tar.xz
 sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index afb2aa92f6..968c8073e4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.12.0
+QEMU_VERSION = 2.12.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
