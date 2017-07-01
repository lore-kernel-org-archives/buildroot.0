From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 17:56:03 +0200
Subject: [Buildroot] [git commit] tools: move scanpypi out of
	support/scripts/
Message-ID: <20170701160503.9E49B800B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb4184d9051c4350762c38dc8f316883861ccc5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 tools/readme.txt                    | 4 ++++
 {support/scripts => tools}/scanpypi | 0
 2 files changed, 4 insertions(+)

diff --git a/tools/readme.txt b/tools/readme.txt
index 2058174..9484333 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -15,6 +15,10 @@ scancpan
     a script to create a Buildroot package by scanning a CPAN module
     description.
 
+scanpypi
+    a script to create a Buildroot package by scanning a PyPI package
+    description.
+
 size-stat-compare
     a script to compare the rootfs size between two differnt Buildroot
     configurations. This can be used to identify the size impact of
diff --git a/support/scripts/scanpypi b/tools/scanpypi
similarity index 100%
rename from support/scripts/scanpypi
rename to tools/scanpypi
