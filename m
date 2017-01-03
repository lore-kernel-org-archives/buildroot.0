From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 23:53:42 +0100
Subject: [Buildroot] [git commit] granite: bump to version 0.4.0.1
Message-ID: <20170103225412.C79267FB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4df8b4d8cd54c8d42fff4fc0e9f103b243d2288e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/granite/granite.hash | 6 +++---
 package/granite/granite.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/granite/granite.hash b/package/granite/granite.hash
index 5ce95e6..3c89685 100644
--- a/package/granite/granite.hash
+++ b/package/granite/granite.hash
@@ -1,4 +1,4 @@
-# From https://launchpad.net/granite/0.3/0.3.1/+download/granite-0.3.1.tar.xz/+md5
-md5	4297d4fcec8cfe2e08b460a45c779bbe	granite-0.3.1.tar.xz
+# From https://launchpad.net/granite/0.4/0.4.0.1/+download/granite-0.4.0.1.tar.xz/+md5
+md5	db41150ca6e77162392362686e848086	granite-0.3.1.tar.xz
 # Calculated based on the hash above
-sha256	8ec1d61f9aba75f1b3a745e721288b0dfb34cb11d1307be80cef7b0571c2dec6	granite-0.3.1.tar.xz
+sha256	95a142a8befeedc35a089d638e759b657905508dc3007036d6c1fa3efe94c4dd	granite-0.4.0.1.tar.xz
diff --git a/package/granite/granite.mk b/package/granite/granite.mk
index dd5a09e..3faedf9 100644
--- a/package/granite/granite.mk
+++ b/package/granite/granite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GRANITE_VERSION_MAJOR = 0.3
-GRANITE_VERSION = $(GRANITE_VERSION_MAJOR).1
+GRANITE_VERSION_MAJOR = 0.4
+GRANITE_VERSION = $(GRANITE_VERSION_MAJOR).0.1
 GRANITE_SITE = https://launchpad.net/granite/$(GRANITE_VERSION_MAJOR)/$(GRANITE_VERSION)/+download
 GRANITE_SOURCE = granite-$(GRANITE_VERSION).tar.xz
 GRANITE_DEPENDENCIES = host-pkgconf host-vala libgee libglib2 libgtk3
