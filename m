From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 17:55:18 +0200
Subject: [Buildroot] [git commit] tools: move scancpan out of
	support/scripts/
Message-ID: <20170701160503.715FF7F9C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb5a6878c1802c793e6262f3fc6f7d38cd0df25d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Fran??ois Perrad" <francois.perrad@gadz.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 tools/readme.txt                    | 4 ++++
 {support/scripts => tools}/scancpan | 0
 2 files changed, 4 insertions(+)

diff --git a/tools/readme.txt b/tools/readme.txt
index dd8a1d4..2058174 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -11,6 +11,10 @@ get-developpers
     of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
     input, a package name or and architecture name.
 
+scancpan
+    a script to create a Buildroot package by scanning a CPAN module
+    description.
+
 size-stat-compare
     a script to compare the rootfs size between two differnt Buildroot
     configurations. This can be used to identify the size impact of
diff --git a/support/scripts/scancpan b/tools/scancpan
similarity index 100%
rename from support/scripts/scancpan
rename to tools/scancpan
