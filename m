From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:23:42 +0100
Subject: [Buildroot] [git commit] package/libcli: bump version to 1.10.4
Message-ID: <20210207091615.8C1F7807E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b973385ac8be44cfa56e7fbc9c5d40ec334acfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed whitespace and updated project URL in Config.in.
Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcli/Config.in   | 4 ++--
 package/libcli/libcli.hash | 4 ++--
 package/libcli/libcli.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libcli/Config.in b/package/libcli/Config.in
index 3b625c3648..b2829cad3f 100644
--- a/package/libcli/Config.in
+++ b/package/libcli/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_LIBCLI
 	bool "libcli"
 	help
 	  Libcli provides a shared library for including a Cisco-like
-	  command- line interface into other software. It's a telnet
+	  command-line interface into other software. It's a telnet
 	  interface which supports command-line editing, history,
 	  authentication and callbacks for a user-definable function
 	  tree.
 
-	  http://sites.dparrish.com/libcli
+	  https://github.com/dparrish/libcli
diff --git a/package/libcli/libcli.hash b/package/libcli/libcli.hash
index ce4373e92b..a17a176fe5 100644
--- a/package/libcli/libcli.hash
+++ b/package/libcli/libcli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 190f0a315dbc291400e9d33f701f9a66894102a6c29e1aebb63f01239bb164d0  libcli-1.10.2.tar.gz
-sha256 376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
+sha256  43efade6f3deb621e1e226b7854274a869fca57e12e74e61c5496d5dea7c445d  libcli-1.10.4.tar.gz
+sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
diff --git a/package/libcli/libcli.mk b/package/libcli/libcli.mk
index bc46082546..2dedc9d5df 100644
--- a/package/libcli/libcli.mk
+++ b/package/libcli/libcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCLI_VERSION = 1.10.2
+LIBCLI_VERSION = 1.10.4
 LIBCLI_SITE = $(call github,dparrish,libcli,V$(LIBCLI_VERSION))
 LIBCLI_LICENSE = LGPL-2.1
 LIBCLI_LICENSE_FILES = COPYING
