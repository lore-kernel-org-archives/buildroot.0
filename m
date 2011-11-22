From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 22 Nov 2011 12:55:16 -0500
Subject: [Buildroot] [PATCH] docs: Fix assumed copy+paste error.
Message-ID: <1321984516-29323-1-git-send-email-twoerner@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 docs/buildroot.html                        |    2 +-
 docs/manual/adding-packages-gentargets.txt |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index d5be127..e13e8f7 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1031,7 +1031,7 @@ $(eval $(call GENTARGETS,package,libfoo,host))
 
       <li><code>LIBFOO_SOURCE</code> may contain the name of the tarball of
       the package. If <code>HOST_LIBFOO_SOURCE</code> is not specified, it
-      defaults to <code>LIBFOO_VERSION</code>. If none are specified, then
+      defaults to <code>LIBFOO_SOURCE</code>. If none are specified, then
       the value is assumed to be
       <code>packagename-$(LIBFOO_VERSION).tar.gz</code>.<br/>Example:
       <code>LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2</code></li>
diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index 29fc640..b344494 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -131,7 +131,7 @@ information is (assuming the package name is +libfoo+) :
 
 * +LIBFOO_SOURCE+ may contain the name of the tarball of
   the package. If +HOST_LIBFOO_SOURCE+ is not specified, it
-  defaults to +LIBFOO_VERSION+. If none are specified, then
+  defaults to +LIBFOO_SOURCE+. If none are specified, then
   the value is assumed to be
   +packagename-$(LIBFOO_VERSION).tar.gz+. +
   Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
-- 
1.7.6.233.gd79bc
