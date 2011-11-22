From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Nov 2011 20:59:37 +0100
Subject: [Buildroot] [git commit] docs: Fix assumed copy+paste error.
Message-ID: <20111122195957.8D4F28F65C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a63f1a08c4e7d9df4bf3d0eed48b4d5447e6c26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
