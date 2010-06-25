From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Fri, 25 Jun 2010 12:02:03 +0200
Subject: [Buildroot] docs: Fixed spelling error in buildroot.html GETTEXT
	instead of GNUTTEXT
In-Reply-To: <20100625091927.4c67886b@surf>
References: <201005140300.25098.PeterHuewe@gmx.de>
	<201006241726.25775.PeterHuewe@gmx.de>
	<20100625091927.4c67886b@surf>
Message-ID: <201006251202.03441.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Huewe <peterhuewe@gmx.de>

Fixed spelling error in Documentation buildroot.html#gettext-integration

GETTEXT instead of GNUTTEXT

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 docs/buildroot.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 71bd72b..52d8391 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1633,7 +1633,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     <p>Therefore, packages that unconditionnally need gettext should:</p>
 
     <ol>
-      <li>Use <code>select BR2_PACKAGE_GNUTTEXT if
+      <li>Use <code>select BR2_PACKAGE_GETTEXT if
       BR2_NEEDS_GETTEXT</code> and possibly <code>select
       BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT</code> if libintl is
       also needed</li>
@@ -1646,7 +1646,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     should:</p>
 
     <ol>
-      <li>Use <code>select BR2_PACKAGE_GNUTTEXT if
+      <li>Use <code>select BR2_PACKAGE_GETTEXT if
       BR2_NEEDS_GETTEXT_IF_LOCALE</code> and possibly <code>select
       BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE</code> if
       libintl is also needed</li>
-- 
1.7.1
