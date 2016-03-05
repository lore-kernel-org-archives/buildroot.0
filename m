From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:03:19 +0100
Subject: [Buildroot] [git commit] libebml: update version
Message-ID: <20160305140419.32D53800FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0c0a4dd36c12012aa349fcc6d777d6d710bc143
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to latest stable version.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libebml/libebml.hash | 2 +-
 package/libebml/libebml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
index d5a8cb8..5abc1eb 100644
--- a/package/libebml/libebml.hash
+++ b/package/libebml/libebml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	195894b31aaca55657c9bc157d744f23b0c25597606b97cfa5a9039c4b684295	libebml-1.3.1.tar.bz2
+sha256	35fb44daa41961f94a0ac1b8f06801e88cc9bf2ad6f562ced8ab7c1f1a875499	libebml-1.3.3.tar.bz2
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 4613c6e..36c8a5c 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEBML_VERSION = 1.3.1
+LIBEBML_VERSION = 1.3.3
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.bz2
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
