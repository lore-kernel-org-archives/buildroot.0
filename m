From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 21:23:55 +0100
Subject: [Buildroot] [git commit] safeclib: fix trailing whitespace
Message-ID: <20180204202521.9748D838BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e04c420b09d6abc2d8d024968b471042562a1dfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes trailing whitespace after MIT

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/50971692

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/safeclib/safeclib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 65c6621e0a..b1aa25992c 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -6,7 +6,7 @@
 
 SAFECLIB_VERSION = v09102017
 SAFECLIB_SITE = $(call github,rurban,safeclib,$(SAFECLIB_VERSION))
-SAFECLIB_LICENSE = MIT 
+SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
 # From git
