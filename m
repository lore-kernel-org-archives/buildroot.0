From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 12:34:29 +0200
Subject: [Buildroot] [git commit] manual: cleanup appendix.txt
Message-ID: <20130504112538.70B6799AA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88f2b4360ab4f98d16252f511eb305ca26c75189
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: one more stuff->feature fixup]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/appendix.txt        |   29 ++++++++++++++++++++---------
 docs/manual/deprecated-list.txt |    2 +-
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index c48c3b1..486d82f 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -7,15 +7,26 @@ Appendix
 include::makedev-syntax.txt[]
 include::makeusers-syntax.txt[]
 
+
+// Automatically generated lists:
+
 [[package-list]]
-Available packages
-------------------
-// docs/manaual/pkg-list.txt is generated using the following command:
-// $ git grep -E '\((autotools|cmake|generic)-package\)' package/ |  \
-//     cut -d':' -f1 | grep '\.mk$' | \
-//     sed -e 's;.*\?/\(.*\?\).mk;* \1;' | \
-//     sort > docs/manual/pkg-list.txt
-
-include::pkg-list.txt[]
+Package Selection for the target
+--------------------------------
+
+include::package-list.txt[]
+
+[[host-package-list]]
+Host utilities
+--------------
+
+include::host-package-list.txt[]
+
+[[deprecated-list]]
+Deprecated features
+-------------------
+
+The following features are marked as _deprecated_ in Buildroot due to
+their status either too old or unmaintained.
 
 include::deprecated-list.txt[]
diff --git a/docs/manual/deprecated-list.txt b/docs/manual/deprecated-list.txt
index 6dc87a4..9c8f105 100644
--- a/docs/manual/deprecated-list.txt
+++ b/docs/manual/deprecated-list.txt
@@ -4,7 +4,7 @@
 Deprecated list
 ---------------
 
-The following stuff are marked as _deprecated_ in Buildroot due to
+The following features are marked as _deprecated_ in Buildroot due to
 their status either too old or unmaintained.
 
 // list generated using the followings command:
