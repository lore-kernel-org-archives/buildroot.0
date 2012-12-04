From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 13:55:32 -0800
Subject: [Buildroot] [git commit] gmp: add license information
Message-ID: <20121204215925.8713699951@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf0ea51fdd963d3b955847ba7c4de6270c078428
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gmp/gmp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5bcc6c1..72673c7 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -8,6 +8,8 @@ GMP_VERSION = 5.0.5
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
+GMP_LICENSE = LGPLv3+
+GMP_LICENSE_FILES = COPYING.LIB
 
 # Bad ARM assembly breaks on pure thumb
 ifeq ($(ARCH),arm)
