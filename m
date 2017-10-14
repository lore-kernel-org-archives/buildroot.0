From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Oct 2017 10:04:20 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] qemu: change to .tar.xz
	format
Message-ID: <20171014110317.DC7C2810E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7fb34cc889be0756b256fae11317d48a4b9c5fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

And use the official download location.

Suggested-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b79547014d0cdbf34aa4112a464a63f9e865b9ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 5164303..405d192 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 f62ab18a1fb9ff5b4c81ed44becc945b11581eff777618141bdb787da55d3638  qemu-2.8.1.1.tar.bz2
+sha256 7b50634d729dcabe4a96d74062832274fa2f4c883e82904f5e6955f801edab54  qemu-2.8.1.1.tar.xz
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1fe4da4..1cb6ed1 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 QEMU_VERSION = 2.8.1.1
-QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
-QEMU_SITE = http://wiki.qemu.org/download
+QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
+QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #??NOTE: there is no top-level license file for non-(L)GPL licenses;
