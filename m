From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:31:48 +0100
Subject: [Buildroot] [git commit] binutils: add license info
Message-ID: <20121114214724.BF99699FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1629ea3ff9215c18036abd95ac16cf05cd3118d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/binutils.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index e1aac9b..6c51fc7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -29,6 +29,8 @@ endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+BINUTILS_LICENSE = GPLv3+, libiberty LGPLv2.1+
+BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 
 # We need to specify host & target to avoid breaking ARM EABI
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
