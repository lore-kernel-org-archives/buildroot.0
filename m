From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Sep 2017 22:34:52 +0200
Subject: [Buildroot] [PATCH 1/2 v2] docs/manual: add appendix about
	migration from older versions
In-Reply-To: <cover.1504643670.git.yann.morin.1998@free.fr>
References: <cover.1504643670.git.yann.morin.1998@free.fr>
Message-ID: <10e9b4eda0189190444421da07e98c7f43cd56dd.1504643670.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and move the br2-external migration to it.

Reported-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>

---
Changes v1 -> v2:
  - move in a sing;e file  (Thomas)
  - fix title typo  (ThomaS)
---
 docs/manual/appendix.txt                                   | 2 +-
 docs/manual/{br2-external-converting.txt => migrating.txt} | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)
 rename docs/manual/{br2-external-converting.txt => migrating.txt} (81%)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 4d4bbecc18..86afa4bdaa 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -3,4 +3,4 @@
 
 include::makedev-syntax.txt[]
 include::makeusers-syntax.txt[]
-include::br2-external-converting.txt[]
+include::migrating.txt[]
diff --git a/docs/manual/br2-external-converting.txt b/docs/manual/migrating.txt
similarity index 81%
rename from docs/manual/br2-external-converting.txt
rename to docs/manual/migrating.txt
index 831addf5af..5dd83ce8d6 100644
--- a/docs/manual/br2-external-converting.txt
+++ b/docs/manual/migrating.txt
@@ -1,8 +1,15 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
+[[migrating-from-ol-versions]]
+== Migrating from older Buildroot versions
+
+Some versions have introduced backaward incompatibilities. This section
+explains those incompatibilities, and for each explains what to do to
+complete the migration.
+
 [[br2-external-converting]]
-== Converting old br2-external trees
+=== Migrating to 2016.11
 
 Before Buildroot 2016.11, it was possible to use only one br2-external
 tree at once. With Buildroot 2016.11 came the possibility to use more
-- 
2.11.0
