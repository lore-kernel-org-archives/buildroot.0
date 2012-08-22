From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 19:41:15 +0200
Subject: [Buildroot] [git commit] fontconfig: add license info
Message-ID: <20120822174958.93CB197251@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53136e92bc8d0141e753d507667cd3848e6cac51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/fontconfig/fontconfig.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 843b34f..9845656 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -6,6 +6,8 @@
 FONTCONFIG_VERSION = 2.6.0
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
 FONTCONFIG_SITE = http://fontconfig.org/release
+FONTCONFIG_LICENSE = fontconfig license
+FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
 # This package does not like using the target cflags for some reason.
