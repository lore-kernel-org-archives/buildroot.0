From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Aug 2014 22:20:08 +0200
Subject: [Buildroot] [PATCH 3 of 8 RFCv2 for 2014.08] manual/getting
 started: rename and move 'Getting involved' section
In-Reply-To: <patchbomb.1407874805@localhost>
References: <patchbomb.1407874805@localhost>
Message-ID: <c55bf02ff149d6fc4189.1407874808@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Getting Involved section is actually an overview of the ways to interact
with the Buildroot community, which is useful for developers _and_ users.
Therefore, this patch moves the section from the Developer Guide to the
Getting Started section, and renames it to 'Community Resources'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: I'm open to other names than 'Community Resources'

 docs/manual/get-involved.txt |  2 +-
 docs/manual/manual.txt       |  4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff -r 384a21645bf2 -r c55bf02ff149 docs/manual/get-involved.txt
--- a/docs/manual/get-involved.txt	Wed Aug 06 20:28:19 2014 +0200
+++ b/docs/manual/get-involved.txt	Thu Aug 07 18:05:13 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Getting involved
+== Community resources
 
 Like any open source project, Buildroot has different ways to share
 information in its community and outside.
diff -r 384a21645bf2 -r c55bf02ff149 docs/manual/manual.txt
--- a/docs/manual/manual.txt	Wed Aug 06 20:28:19 2014 +0200
+++ b/docs/manual/manual.txt	Thu Aug 07 18:05:13 2014 +0200
@@ -22,6 +22,8 @@
 
 include::starting-up.txt[]
 
+include::get-involved.txt[]
+
 = User guide
 
 include::working-with.txt[]
@@ -40,8 +42,6 @@
 
 include::developer-guide.txt[]
 
-include::get-involved.txt[]
-
 include::contribute.txt[]
 
 = Appendix
