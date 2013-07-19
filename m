From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 23:44:09 +0200
Subject: [Buildroot] [git commit] trivial: add space in 'bool"package"'
	construct in Config.in
Message-ID: <20130719220802.E14559A225@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53f74fb5229e52f0939c9624fd17f5ef5f7a1e75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In early buildroot, it apparently was customary to have following style in
Config.in files:
    bool"expat"

Nowadays, only two packages remain with this style: diffutils and expat.
This trivial patch lines them up with the style:
    bool "expat"

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/diffutils/Config.in |    2 +-
 package/expat/Config.in     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/diffutils/Config.in b/package/diffutils/Config.in
index 4cc16e2..7b2c9f9 100644
--- a/package/diffutils/Config.in
+++ b/package/diffutils/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_DIFFUTILS
-	bool"diffutils"
+	bool "diffutils"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
diff --git a/package/expat/Config.in b/package/expat/Config.in
index 3988c90..758fb7d 100644
--- a/package/expat/Config.in
+++ b/package/expat/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_EXPAT
-	bool"expat"
+	bool "expat"
 	help
 	  The Expat XML Parser.
 
