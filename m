From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:13:17 +0200
Subject: [Buildroot] [git commit] docs/manual: add appendix about migration
	from older versions
Message-ID: <20170906200621.5CD258216D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11e548f1e6107ace611a1dece926cf96090d9333
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... and move the br2-external migration to it.

Reported-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/appendix.txt                                   | 2 +-
 docs/manual/{br2-external-converting.txt => migrating.txt} | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 4d4bbec..86afa4b 100644
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
index 831addf..24ea2e0 100644
--- a/docs/manual/br2-external-converting.txt
+++ b/docs/manual/migrating.txt
@@ -1,8 +1,15 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
+[[migrating-from-ol-versions]]
+== Migrating from older Buildroot versions
+
+Some versions have introduced backward incompatibilities. This section
+explains those incompatibilities, and for each explains what to do to
+complete the migration.
+
 [[br2-external-converting]]
-== Converting old br2-external trees
+=== Migrating to 2016.11
 
 Before Buildroot 2016.11, it was possible to use only one br2-external
 tree at once. With Buildroot 2016.11 came the possibility to use more
