From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Aug 2014 21:39:54 +0200
Subject: [Buildroot] [PATCH 3 of 3 for 2014.08] manual: file organization:
 rename files to match new section title
In-Reply-To: <patchbomb.1408563591@localhost>
References: <patchbomb.1408563591@localhost>
Message-ID: <c58498b01049540e0d4f.1408563594@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the renaming of some sections, rename the corresponding files for
clarity.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -24,9 +24,9 @@
 
 include::getting.txt[]
 
-include::using.txt[]
+include::quickstart.txt[]
 
-include::get-involved.txt[]
+include::resources.txt[]
 
 = User guide
 
diff --git a/docs/manual/using.txt b/docs/manual/quickstart.txt
rename from docs/manual/using.txt
rename to docs/manual/quickstart.txt
diff --git a/docs/manual/get-involved.txt b/docs/manual/resources.txt
rename from docs/manual/get-involved.txt
rename to docs/manual/resources.txt
