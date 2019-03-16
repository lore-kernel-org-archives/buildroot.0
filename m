From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Mar 2019 19:31:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/xvkbd: bump to version 3.9
Message-ID: <20190316183115.27032-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add COPYING to license files as README does not contain the full GPL
  text
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xvkbd/xvkbd.hash | 4 +++-
 package/xvkbd/xvkbd.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/xvkbd/xvkbd.hash b/package/xvkbd/xvkbd.hash
index 18148e5e09..402d3179ab 100644
--- a/package/xvkbd/xvkbd.hash
+++ b/package/xvkbd/xvkbd.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256	895f768269820e7c0379b0daac3687bda0c670d192ebb7e61e5613a5939ec90b	xvkbd-3.7.tar.gz
+sha256	b81c37ddfb7b78993dad15d304f8fd78e540d57c0a72f7e3316fd45fba919a9d	xvkbd-3.9.tar.gz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256	7f72a6f6e9a183efe65fb22c77f41bf076582f8a375881129461f50652af61e4	README
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 132d7e1f0c..4c2befe962 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XVKBD_VERSION = 3.7
+XVKBD_VERSION = 3.9
 XVKBD_SITE = http://t-sato.in.coocan.jp/xvkbd
 XVKBD_LICENSE = GPL-2.0+
-XVKBD_LICENSE_FILES = README
+XVKBD_LICENSE_FILES = COPYING README
 
 # Passing USRLIBDIR ensures that the stupid Makefile doesn't add
 # /usr/lib to the library search path.
-- 
2.14.1
