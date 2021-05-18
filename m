From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 13:42:38 +0200
Subject: [Buildroot] [git commit branch/next] package/nano: bump to version
 5.7
Message-ID: <20210518111411.BDBA786AE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=845acb9c31fd0f8f547f6cc84ea5007ae23ace8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index cbb4977223..532a68e0c9 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v5/nano-5.6.1.tar.xz.asc
+# https://www.nano-editor.org/dist/v5/nano-5.7.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  760d7059e0881ca0ee7e2a33b09d999ec456ff7204df86bee58eb6f523ee8b09  nano-5.6.1.tar.xz
+sha256  d4b181cc2ec11def3711b4649e34f2be7a668e70ab506860514031d069cccafa  nano-5.7.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 77126fd4b0..39d9be12ba 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 5
-NANO_VERSION = $(NANO_VERSION_MAJOR).6.1
+NANO_VERSION = $(NANO_VERSION_MAJOR).7
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
