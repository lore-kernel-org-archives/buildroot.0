From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 22:46:13 +0100
Subject: [Buildroot] [git commit] docs/about.html: we support internal
	(e)glibc toolchains as well now
Message-ID: <20131111220328.5AA259BBE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=439f48736b35e59262d97078ad904dbe3ef51f46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/about.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/about.html b/docs/about.html
index bf78db3..ae409fc 100644
--- a/docs/about.html
+++ b/docs/about.html
@@ -45,8 +45,8 @@ cross-compilation process.</p>
   filesystem image: JFFS2, UBIFS, tarballs, romfs, cramfs, squashfs
   and more.</li>
 
-  <li>Can generate an uClibc cross-compilation toolchain, or re-use
-  your existing glibc, eglibc or uClibc cross-compilation
+  <li>Can generate an (e)glibc or uClibc cross-compilation toolchain,
+  or re-use your existing glibc, eglibc or uClibc cross-compilation
   toolchain</li>
 
   <li>Has a <b>simple structure</b> that makes it easy to understand
