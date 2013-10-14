From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Oct 2013 09:22:38 +0200
Subject: [Buildroot] [PATCH] manual: rename section name of package lists
Message-ID: <ab29385dc7907035d6d7.1381735358@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original titles did no longer correspond with the actual menu names.
Additionally, choose a name that better reflects the fact that this is a
list.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/appendix.txt |  8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -11,14 +11,14 @@ include::makeusers-syntax.txt[]
 // Automatically generated lists:
 
 [[package-list]]
-Package Selection for the target
---------------------------------
+List of target packages available in Buildroot
+----------------------------------------------
 
 include::package-list.txt[]
 
 [[host-package-list]]
-Host utilities
---------------
+List of host utilities available in Buildroot
+---------------------------------------------
 
 The following packages are all available in the menu +Host utilities+.
 
