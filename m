From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  3 Jan 2019 21:47:47 +0100
Subject: [Buildroot] [PATCH] docs/manual: fix typo get-developer (->
 get-developers)
Message-ID: <20190103204748.1149-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The script is utils/get-developers but the manual refers to get-developer in
several places.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 docs/manual/developers.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
index 0da499e100..7058d57b20 100644
--- a/docs/manual/developers.txt
+++ b/docs/manual/developers.txt
@@ -6,7 +6,7 @@
 
 The main Buildroot directory contains a file named +DEVELOPERS+ that
 lists the developers involved with various areas of Buildroot. Thanks
-to this file, the +get-developer+ tool allows to:
+to this file, the +get-developers+ tool allows to:
 
 - Calculate the list of developers to whom patches should be sent, by
   parsing the patches and matching the modified files with the
@@ -26,21 +26,21 @@ to include in his patch the appropriate modification to the
 The +DEVELOPERS+ file format is documented in detail inside the file
 itself.
 
-The +get-developer+ tool, located in +utils/+ allows to use
+The +get-developers+ tool, located in +utils/+ allows to use
 the +DEVELOPERS+ file for various tasks:
 
 - When passing one or several patches as command line argument,
-  +get-developer+ will return the appropriate +git send-email+
+  +get-developers+ will return the appropriate +git send-email+
   command. If the +-e+ option is passed, only the email addresses are
   printed in a format suitable for +git send-email --cc-cmd+.
 
-- When using the +-a <arch>+ command line option, +get-developer+ will
+- When using the +-a <arch>+ command line option, +get-developers+ will
   return the list of developers in charge of the given architecture.
 
-- When using the +-p <package>+ command line option, +get-developer+
+- When using the +-p <package>+ command line option, +get-developers+
   will return the list of developers in charge of the given package.
 
-- When using the +-c+ command line option, +get-developer+ will look
+- When using the +-c+ command line option, +get-developers+ will look
   at all files under version control in the Buildroot repository, and
   list the ones that are not handled by any developer. The purpose of
   this option is to help completing the +DEVELOPERS+ file.
-- 
2.18.1
