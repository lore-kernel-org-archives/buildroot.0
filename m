From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] pax-utils: remove empty host dependencies
	definition
Message-ID: <20160703082409.BEFB6800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43fdc9e9c999cf1aa12ccd159b83f50f0191b382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pax-utils/pax-utils.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index 747c2bb..8d5f3ee 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -27,9 +27,6 @@ else
 PAX_UTILS_CONF_OPTS += --without-seccomp
 endif
 
-# libcap is only useful for pspax (a running system)
-HOST_PAX_UTILS_DEPENDENCIES =
-
 # lddtree and symtree need bash
 ifeq ($(BR2_PACKAGE_BASH),)
 define PAX_UTILS_REMOVE_BASH_TOOLS
