From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 17:54:29 +0200
Subject: [Buildroot] [git commit] tools: move size-stat-compare out of
	support/scripts/
Message-ID: <20170701160503.52EBA7F9C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1cbf3b9f9e0b7fb35b54addf63630be5951e284
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 tools/readme.txt                              | 6 ++++++
 {support/scripts => tools}/size-stats-compare | 0
 2 files changed, 6 insertions(+)

diff --git a/tools/readme.txt b/tools/readme.txt
index fc1108f..dd8a1d4 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -11,6 +11,12 @@ get-developpers
     of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
     input, a package name or and architecture name.
 
+size-stat-compare
+    a script to compare the rootfs size between two differnt Buildroot
+    configurations. This can be used to identify the size impact of
+    a specific option, or of a set of specific options, or an update
+    to a newer Buildroot version...
+
 test-pkg
     a script that tests a specific package against a set of various
     toolchains, with the goal to detect toolchain-related dependencies
diff --git a/support/scripts/size-stats-compare b/tools/size-stats-compare
similarity index 100%
rename from support/scripts/size-stats-compare
rename to tools/size-stats-compare
