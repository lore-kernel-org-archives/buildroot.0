From: Simon Dawson <spdawson@gmail.com>
Date: Mon,  2 Jun 2014 17:02:45 +0100
Subject: [Buildroot] [PATCH] manual: make consistent references to package
	metadata information
Message-ID: <1401724965-4195-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The de facto standard terminology in the manual appears to be "package
metadata information"; fix a couple of inconsistent references to package
"meta-information" and "meta information".

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 2 +-
 docs/manual/adding-packages-luarocks.txt  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index f735244..070718e 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -27,7 +27,7 @@ config BR2_PACKAGE_LIBFOO
 	  http://foosoftware.org/libfoo/
 ---------------------------
 
-The +bool+ line, +help+ line and other meta-information about the
+The +bool+ line, +help+ line and other metadata information about the
 configuration option must be indented with one tab. The help text
 itself should be indented with one tab and two spaces, and it must
 mention the upstream URL of the project.
diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index f307e4d..10137a8 100644
--- a/docs/manual/adding-packages-luarocks.txt
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -57,7 +57,7 @@ infrastructures in Buildroot, respectively.
 
 The main macro of the LuaRocks package infrastructure is +luarocks-package+:
 like +generic-package+ it works by defining a number of variables providing
-meta information about the package, and then calling +luarocks-package+. It
+metadata information about the package, and then calling +luarocks-package+. It
 is worth mentioning that building LuaRocks packages for the host is not
 supported, so the macro +host-luarocks-package+ is not implemented.
 
-- 
1.9.1
