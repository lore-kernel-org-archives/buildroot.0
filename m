From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 6 Feb 2011 21:08:38 +0100
Subject: [Buildroot] [git commit master 1/1] docs: add missing info about
	Bazaar (bzr) download method
Message-ID: <20110206200904.A09918F347@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9639a9ab88f02c18f7d6994516e82a3489210249
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index b766e41..8d74410 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1061,12 +1061,12 @@ $(eval $(call GENTARGETS,package,libfoo,host))
       <li><code>LIBFOO_SITE_METHOD</code> may contain the method to
       fetch the package source code. It can either
       be <code>wget</code> (for normal FTP/HTTP downloads of
-      tarballs), <code>svn</code> or <code>git</code>. When not
-      specified, it is guessed from the URL given
-      in <code>LIBFOO_SITE</code>: <code>git://</code>
-      and <code>svn://</code> URLs will use the <code>git</code>
-      and <code>svn</code> methods respectively. All other URL-types
-      will use the <code>wget</code> method. So for example, in the
+      tarballs), <code>svn</code>, <code>git</code> or <code>bzr</code>.
+      When not specified, it is guessed from the URL given
+      in <code>LIBFOO_SITE</code>: <code>svn://</code>, <code>git://</code>
+      and <code>bzr://</code> URLs will use the <code>svn</code>,
+      <code>git</code> and <code>bzr</code> methods respectively. All other
+      URL-types will use the <code>wget</code> method. So for example, in the
       case of a package whose source code is available through
       Subversion repository on HTTP, one <i>must</i>
       specifiy <code>LIBFOO_SITE_METHOD=svn</code>. For <code>svn</code>
-- 
1.7.3.4
