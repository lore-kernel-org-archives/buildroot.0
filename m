From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2020 15:12:46 +0200
Subject: [Buildroot] [git commit] docs/manual: fix typo
Message-ID: <20200823130554.BD81381F7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=531e96e98cc8cd6fb839349ea0f86c9d5706ec0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

depednencies -> dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-qmake.txt | 2 +-
 docs/manual/adding-packages-waf.txt   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-qmake.txt b/docs/manual/adding-packages-qmake.txt
index 8d26023904..e1621e914e 100644
--- a/docs/manual/adding-packages-qmake.txt
+++ b/docs/manual/adding-packages-qmake.txt
@@ -34,7 +34,7 @@ will automatically download the tarball from this location.
 
 On line 10, we tell Buildroot what options to enable for libfoo.
 
-On line 11, we tell Buildroot the depednencies of libfoo.
+On line 11, we tell Buildroot the dependencies of libfoo.
 
 Finally, on line line 13, we invoke the +qmake-package+
 macro that generates all the Makefile rules that actually allows the
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
