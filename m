From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Nov 2012 00:10:43 +0100
Subject: [Buildroot] [git commit] adding-package-generic.txt:
	BR2_SOURCEFORGE_MIRROR is no more
Message-ID: <20121106231131.4612D99C05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf76170cc3418f36dd9e4daa2f3d0618ce3dc389
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-generic.txt |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index e1b46b0..7ecdb91 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -167,9 +167,7 @@ information is (assuming the package name is +libfoo+) :
   slash for absolute paths:
   +scp://[user@]host:/absolutepath+. +
   If +HOST_LIBFOO_SITE+ is not specified, it defaults to
-  +LIBFOO_SITE+. If none are specified, then the location is assumed
-  to be
-  +http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename+. +
+  +LIBFOO_SITE+.
   Examples: +
     +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
     +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+ +
