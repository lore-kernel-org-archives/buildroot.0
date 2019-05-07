From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:59:28 +0200
Subject: [Buildroot] [git commit] package/mpfr: replace utf-8 space by ascii
 character
Message-ID: <20190507210158.28A6A8125A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8011fcb0d186a0934d82165cf737fe53744710b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpfr/mpfr.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index 593c97d774..ea44b8c20a 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,5 +1,5 @@
 # From http://lists.gnu.org/archive/html/info-gnu/2019-01/msg00019.html
 sha256 1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a  mpfr-4.0.2.tar.xz
 
-#??Hash for license file
+# Hash for license file
 sha256 e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
