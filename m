From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 12:50:37 +0200
Subject: [Buildroot] [git commit] website: get rid of 'Related Sites' list
Message-ID: <20131026105333.19D6F9BBB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dab7ba7a0a3eb0a007cac7cd55ef869478dd301
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on the dev day. These sites are not really directly related
to Buildroot.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/header.html |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/docs/header.html b/docs/header.html
index 12716d0..9c615f4 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -57,26 +57,6 @@
     <br><a href="http://autobuild.buildroot.org">Autobuilder</a>
     <br><a href="http://patchwork.buildroot.org">Patchwork</a>
 
-    <p><b>Related Sites</b>
-    <br><a href="http://busybox.net/">BusyBox</a>
-    <br><a href="http://uclibc.org/">uClibc.org</a>
-    <br><a href="http://cxx.uclibc.org/">uClibc++</a>
-    <br><a href="http://www.scratchbox.org/">Scratchbox</a>
-    <br><a href="http://openembedded.org/">OpenEmbedded</a>
-    <br><a href="http://www.ucdot.org/">uCdot</a>
-    <br><a href="http://linuxgizmos.com/">LinuxGizmos</a>
-    <br><a href="http://slashdot.org/">Slashdot</a>
-    <br><a href="http://freecode.com/">Freecode</a>
-    <br><a href="http://linuxtoday.com/">Linux Today</a>
-    <br><a href="http://lwn.net/">Linux Weekly News</a>
-    <br><a href="http://www.tldp.org/HOWTO">Linux HOWTOs</a>
-
-<!--
-    <a href="http://validator.w3.org/check/referer"><img
-     src="/images/valid-html401.png" height="31" width="88"
-          align="left" border="0" alt="Valid HTML"></a>
--->
-
 </td>
 
 
