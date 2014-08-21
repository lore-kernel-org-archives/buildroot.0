From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:39:33 +0200
Subject: [Buildroot] [git commit] manual: file organization: rename files to
	match new section title
Message-ID: <20140821134003.3E5529D4E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f21256b86adc88665f6fe1c16672ee7ebf76d6db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the renaming of some sections, rename the corresponding files for
clarity.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/manual.txt                          |    4 ++--
 docs/manual/{using.txt => quickstart.txt}       |    0
 docs/manual/{get-involved.txt => resources.txt} |    0
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 592bece..df34f01 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -24,9 +24,9 @@ include::prerequisite.txt[]
 
 include::getting.txt[]
 
-include::using.txt[]
+include::quickstart.txt[]
 
-include::get-involved.txt[]
+include::resources.txt[]
 
 = User guide
 
diff --git a/docs/manual/using.txt b/docs/manual/quickstart.txt
similarity index 100%
rename from docs/manual/using.txt
rename to docs/manual/quickstart.txt
diff --git a/docs/manual/get-involved.txt b/docs/manual/resources.txt
similarity index 100%
rename from docs/manual/get-involved.txt
rename to docs/manual/resources.txt
