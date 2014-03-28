From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 28 Mar 2014 22:24:49 +0100
Subject: [Buildroot] [PATCH 8/9] manual: fix typo in abbreviation 'e.g.'
In-Reply-To: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1396041895-29533-9-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 docs/manual/adding-packages-generic.txt |    4 ++--
 docs/manual/common-usage.txt            |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index e125498..faee3e9 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -150,7 +150,7 @@ On line 31..33, we define a device-node file used by this package
 On line 35..37, we define the permissions to set to specific files
 installed by this package (+LIBFOO_PERMISSIONS+).
 
-On lines 39..41, we define a user that is used by this package (eg.
+On lines 39..41, we define a user that is used by this package (e.g.
 to run a daemon as non-root) (+LIBFOO_USERS+).
 
 Finally, on line 43, we call the +generic-package+ function, which
@@ -335,7 +335,7 @@ information is (assuming the package name is +libfoo+) :
   This variable is optional.
 
 * +LIBFOO_USERS+ lists the users to create for this package, if it installs
-  a program you want to run as a specific user (eg. as a daemon, or as a
+  a program you want to run as a specific user (e.g. as a daemon, or as a
   cron-job). The syntax is similar in spirit to the makedevs one, and is
   described in the xref:makeuser-syntax[]. This variable is optional.
 
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index ca1bffe..d9de598 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -116,7 +116,7 @@ Dealing efficiently with filesystem images
 
 Filesystem images can get pretty big, depending on the filesystem you choose,
 the number of packages, whether you provisioned free space... Yet, some
-locations in the filesystems images may just be _empty_ (eg. a long run of
+locations in the filesystems images may just be _empty_ (e.g. a long run of
 'zeroes'); such a file is called a _sparse_ file.
 
 Most tools can handle sparse files efficiently, and will only store or write
@@ -139,12 +139,12 @@ For example:
 Other tools may have similar options. Please consult their respective man
 pages.
 
-You can use sparse files if you need to store the filesystem images (eg.
-to transfer from one machine to another), or if you need to send them (eg.
+You can use sparse files if you need to store the filesystem images (e.g.
+to transfer from one machine to another), or if you need to send them (e.g.
 to the Q&A team).
 
 Note however that flashing a filesystem image to a device while using the
-sparse mode of +dd+ may result in a broken filesystem (eg. the block bitmap
+sparse mode of +dd+ may result in a broken filesystem (e.g. the block bitmap
 of an ext2 filesystem may be corrupted; or, if you have sparse files in
 your filesystem, those parts may not be all-zeroes when read back). You
 should only use sparse files when handling files on the build machine, not
-- 
1.7.9.5
