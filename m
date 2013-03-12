From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Mar 2013 05:47:16 +0100
Subject: [Buildroot] [PATCH 3/5] manual: cleanup appendix.txt
In-Reply-To: <cover.1363063387.git.s.martin49@gmail.com>
References: <cover.1363063387.git.s.martin49@gmail.com>
Message-ID: <687f3364f028f9fcef05521eee758dbeeffe0321.1363063387.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes since v1:
* move the surrounding text of the list back in appendix.txt (Arnout)
---
 docs/manual/appendix.txt | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index ef34169..ce54b99 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -6,15 +6,26 @@ Appendix
 
 include::makedev-syntax.txt[]
 
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
+Deprecated stuff
+----------------
+
+The following stuff are marked as _deprecated_ in Buildroot due to
+their status either too old or unmaintained.
 
 include::deprecated-list.txt[]
-- 
1.8.1.5
