From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 14:17:48 +0200
Subject: [Buildroot] [git commit] gettext: bump to version 0.19.3
Message-ID: <20141017121829.5406BB328C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e41b89a40feb00757045c16a4be90ce867933e58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file, switch to xz tarball.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gettext/gettext.hash |    3 +++
 package/gettext/gettext.mk   |    3 ++-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
new file mode 100644
index 0000000..d93eba1
--- /dev/null
+++ b/package/gettext/gettext.hash
@@ -0,0 +1,3 @@
+# From http://lists.gnu.org/archive/html/bug-gettext/2014-10/msg00025.html
+md5	092c3f460553ceb4a638ff81d36434c4	gettext-0.19.3.tar.xz
+sha1	5c8e37c5275742b6acc1257e2df9b5d1874c12e3	gettext-0.19.3.tar.xz
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 6932315..2b7b4f2 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.19.2
+GETTEXT_VERSION = 0.19.3
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
+GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
 GETTEXT_LICENSE_FILES = COPYING
