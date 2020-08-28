From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:01:43 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] docs/manual: fix typo
Message-ID: <20200828170234.DCD9983598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d18afcfe4cccca04a887d086fd935506f50a82e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

depednencies -> dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 531e96e98cc8cd6fb839349ea0f86c9d5706ec0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-waf.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.txt
index ffc004c290..101cddf1f1 100644
--- a/docs/manual/adding-packages-waf.txt
+++ b/docs/manual/adding-packages-waf.txt
@@ -34,7 +34,7 @@ will automatically download the tarball from this location.
 
 On line 10, we tell Buildroot what options to enable for libfoo.
 
-On line 11, we tell Buildroot the depednencies of libfoo.
+On line 11, we tell Buildroot the dependencies of libfoo.
 
 Finally, on line line 13, we invoke the +waf-package+
 macro that generates all the Makefile rules that actually allows the
