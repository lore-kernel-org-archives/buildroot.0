From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 08:52:24 +0100
Subject: [Buildroot] [git commit] package/glibc: remove the default value of
 the $(PKG)_SOURCE variable
Message-ID: <20180116080308.C696B83BE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01dc4a9f14b58b71e8ea5a29ec65481132eb3755
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cb3a84a..fd79d84 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,6 @@
 ifeq ($(BR2_arc),y)
 GLIBC_VERSION =  arc-2017.09-release
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
-GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.gz
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
