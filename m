From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 10:40:19 +0200
Subject: [Buildroot] [git commit] QEMU: Bump to 2.3.0
Message-ID: <20150501084246.4947480E19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90d63bdefdf766e8660ebfadc35f8e1b8e37b49c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump QEMU to 2.3.0

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/qemu.hash |    2 +-
 package/qemu/qemu.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 15962af..4f7983f 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 4617154c6ef744b83e10b744e392ad111dd351d435d6563ce24d8da75b1335a0 qemu-2.2.1.tar.bz2
+sha256 b6bab7f763d5be73e7cb5ee7d4c8365b7a8df2972c52fa5ded18893bd8281588 qemu-2.3.0.tar.bz2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index decfc25..d565c88 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.2.1
+QEMU_VERSION = 2.3.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
