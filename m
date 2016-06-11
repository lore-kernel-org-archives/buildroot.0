From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 23:57:19 +0200
Subject: [Buildroot] [git commit] make: bump to version 4.2.1
Message-ID: <20160611215726.CF7B2802D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a907562d7d3cc6056231baab79d78f8f342c455d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/make/make.hash | 6 +++---
 package/make/make.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/make/make.hash b/package/make/make.hash
index 81f7044..ea2e860 100644
--- a/package/make/make.hash
+++ b/package/make/make.hash
@@ -1,4 +1,4 @@
-# From http://lists.gnu.org/archive/html/info-gnu/2016-05/msg00013.html
-md5 85ad14d08766201ffe71efa866f4fb91  make-4.2.tar.bz2
+# From http://lists.gnu.org/archive/html/info-gnu/2016-06/msg00005.html
+md5 15b012617e7c44c0ed482721629577ac  make-4.2.1.tar.bz2
 # Locally calculated after checking signature
-sha256 4e5ce3b62fe5d75ff8db92b7f6df91e476d10c3aceebf1639796dc5bfece655f  make-4.2.tar.bz2
+sha256 d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589  make-4.2.1.tar.bz2
diff --git a/package/make/make.mk b/package/make/make.mk
index 43f4f77..c51ce3b 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKE_VERSION = 4.2
+MAKE_VERSION = 4.2.1
 MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE = $(BR2_GNU_MIRROR)/make
 MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
