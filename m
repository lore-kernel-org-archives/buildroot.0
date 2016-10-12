From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2016 13:55:58 +0200
Subject: [Buildroot] [git commit] vala: bump to version 0.34.1
Message-ID: <20161012115607.4B00A7FFB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ef67797e1040885d39c7f471ecc41a1b80eaa09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index b8d47a6..78367d0 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.34/vala-0.34.0.sha256sum
-sha256	5d59e1ad4c59debc83687b593345a3cf9ef2e9020354145e59a188de4348f455	vala-0.34.0.tar.xz
+# From https://download.gnome.org/sources/vala/0.34/vala-0.34.1.sha256sum
+sha256	f5ccfcfc460a0c6797bfbd7e739042bf5988a0f44d82278dbe1880c0e5f29299	vala-0.34.1.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 2a4d257..3333cf4 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.34
-VALA_VERSION = $(VALA_VERSION_MAJOR).0
+VALA_VERSION = $(VALA_VERSION_MAJOR).1
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
