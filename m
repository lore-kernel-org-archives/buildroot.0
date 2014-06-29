From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:38:11 +0200
Subject: [Buildroot] [git commit] mxs-bootlets: add license information
Message-ID: <20140629084016.CDB3D9D090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47329f41a12358e173ab41e2f0d31ccf2d383fee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/mxs-bootlets/mxs-bootlets.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 6b81030..c0c4b3d 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -34,6 +34,7 @@ ifeq ($(BR2_TARGET_MXS_BOOTLETS_HAS_IVT),y)
 endif
 
 MXS_BOOTLETS_DEPENDENCIES = host-elftosb
+MXS_BOOTLETS_LICENSE = GPLv2+
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
 MXS_BOOTLETS_DEPENDENCIES += barebox
