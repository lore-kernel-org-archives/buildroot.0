From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:29 +0200
Subject: [Buildroot] [git commit] libxslt: remove configure patch
Message-ID: <20141012072420.6E4DEB1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4da996da8e8604f22a11a40942d8ebc4a0f7679
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It dates back to the initial libxslt submission, has no documentation and
doesn't seem to be needed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxslt/libxslt-configure.patch |   18 ------------------
 1 files changed, 0 insertions(+), 18 deletions(-)

diff --git a/package/libxslt/libxslt-configure.patch b/package/libxslt/libxslt-configure.patch
deleted file mode 100644
index aae2e9e..0000000
--- a/package/libxslt/libxslt-configure.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- a/configure	2007-06-12 12:43:03.000000000 -0400
-+++ b/configure	2008-02-18 08:52:36.000000000 -0500
-@@ -22090,15 +22090,11 @@ esac
- 
- 
- 
--XSLT_LIBDIR='-L${libdir}'
--XSLT_INCLUDEDIR='-I${includedir}'
- XSLT_LIBS="-lxslt $LIBXML_LIBS $M_LIBS"
- 
- 
- 
- 
--EXSLT_LIBDIR='-L${libdir}'
--EXSLT_INCLUDEDIR='-I${includedir}'
- EXSLT_LIBS="-lexslt $XSLT_LIBS $LIBGCRYPT_LIBS"
- 
- 
