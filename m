From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 12:50:11 +0200
Subject: [Buildroot] [git commit] manual: rename section name of package
	lists
Message-ID: <20131014112355.1DA499B9FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=127c9bcc136969d6c715441e563e9deb0db6f37f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original titles did no longer correspond with the actual menu names.
Additionally, choose a name that better reflects the fact that this is a
list.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/appendix.txt |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 721c96c..74ee8fd 100644
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
 
