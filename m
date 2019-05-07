From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:36 +0200
Subject: [Buildroot] [PATCH v1 16/28] package/mpfr: replace utf-8 space by
 ascii character
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-16-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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

-#?Hash for license file
+# Hash for license file
 sha256 e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
--
2.21.0
