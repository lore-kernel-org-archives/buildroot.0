From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Sep 2017 21:42:54 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual: add appendis about migration
	from older versions
In-Reply-To: <cover.1504640557.git.yann.morin.1998@free.fr>
References: <cover.1504640557.git.yann.morin.1998@free.fr>
Message-ID: <d0deca1f84eb6ac2674a46b0e8a4f8b5ad326f3f.1504640557.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 docs/manual/appendix.txt                                           | 2 +-
 .../{br2-external-converting.txt => migrating-br2-external.txt}    | 2 +-
 docs/manual/migrating.txt                                          | 7 +++++++
 3 files changed, 9 insertions(+), 2 deletions(-)
 rename docs/manual/{br2-external-converting.txt => migrating-br2-external.txt} (96%)
 create mode 100644 docs/manual/migrating.txt

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 4d4bbecc18..86afa4bdaa 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -3,4 +3,4 @@
 
 include::makedev-syntax.txt[]
 include::makeusers-syntax.txt[]
-include::br2-external-converting.txt[]
+include::migrating.txt[]
diff --git a/docs/manual/br2-external-converting.txt b/docs/manual/migrating-br2-external.txt
similarity index 96%
rename from docs/manual/br2-external-converting.txt
rename to docs/manual/migrating-br2-external.txt
index 831addf5af..c8a2810ea1 100644
--- a/docs/manual/br2-external-converting.txt
+++ b/docs/manual/migrating-br2-external.txt
@@ -2,7 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[br2-external-converting]]
-== Converting old br2-external trees
+=== Converting old br2-external trees
 
 Before Buildroot 2016.11, it was possible to use only one br2-external
 tree at once. With Buildroot 2016.11 came the possibility to use more
diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
new file mode 100644
index 0000000000..068d803a83
--- /dev/null
+++ b/docs/manual/migrating.txt
@@ -0,0 +1,7 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[migrating-from-ol-versions]]
+== Migrating from older Buildroot versions
+
+include::migrating-br2-external.txt[]
-- 
2.11.0
