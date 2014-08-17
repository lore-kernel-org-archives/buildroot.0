From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:09:52 +0200
Subject: [Buildroot] [git commit] manual/getting started: rename and move
	'Getting involved' section
Message-ID: <20140817191115.E5E059D46F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5712140af4f62de36187530c5c0f745742aacd16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Getting Involved section is actually an overview of the ways to interact
with the Buildroot community, which is useful for developers _and_ users.
Therefore, this patch moves the section from the Developer Guide to the
Getting Started section, and renames it to 'Community Resources'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/get-involved.txt |    2 +-
 docs/manual/manual.txt       |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
index 929560e..622597d 100644
--- a/docs/manual/get-involved.txt
+++ b/docs/manual/get-involved.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Getting involved
+== Community resources
 
 Like any open source project, Buildroot has different ways to share
 information in its community and outside.
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 6730e53..053d443 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -22,6 +22,8 @@ include::introduction.txt[]
 
 include::starting-up.txt[]
 
+include::get-involved.txt[]
+
 = User guide
 
 include::working-with.txt[]
@@ -40,8 +42,6 @@ include::beyond-buildroot.txt[]
 
 include::developer-guide.txt[]
 
-include::get-involved.txt[]
-
 include::contribute.txt[]
 
 = Appendix
