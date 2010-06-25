From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Jun 2010 14:15:12 +0200
Subject: [Buildroot] [git commit master 1/1] docs: Fixed spelling error in
	buildroot.html GETTEXT instead of GNUTTEXT
Message-ID: <20100625121534.60BA7818B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f4abd4e61215b119d38ccba011a901732ce704e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed spelling error in Documentation buildroot.html#gettext-integration

GETTEXT instead of GNUTTEXT

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 4f14e08..48854de 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1619,7 +1619,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     <p>Therefore, packages that unconditionnally need gettext should:</p>
 
     <ol>
-      <li>Use <code>select BR2_PACKAGE_GNUTTEXT if
+      <li>Use <code>select BR2_PACKAGE_GETTEXT if
       BR2_NEEDS_GETTEXT</code> and possibly <code>select
       BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT</code> if libintl is
       also needed</li>
@@ -1632,7 +1632,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     should:</p>
 
     <ol>
-      <li>Use <code>select BR2_PACKAGE_GNUTTEXT if
+      <li>Use <code>select BR2_PACKAGE_GETTEXT if
       BR2_NEEDS_GETTEXT_IF_LOCALE</code> and possibly <code>select
       BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE</code> if
       libintl is also needed</li>
-- 
1.7.1
