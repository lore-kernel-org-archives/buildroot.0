From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Aug 2020 21:20:01 +0200
Subject: [Buildroot] [PATCH 1/1] docs/manual: fix typo
Message-ID: <20200822192001.1836121-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

depednencies -> dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.28.0
