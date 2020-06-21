From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 14:06:55 +0200
Subject: [Buildroot] [git commit] package/libplatform: bump version
Message-ID: <20200621121317.3D67082A1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be96d88a3a33d5df02a694ccb9484f533131167b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libplatform/libplatform.hash | 4 ++--
 package/libplatform/libplatform.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
index 09f9dadb19..f08435da12 100644
--- a/package/libplatform/libplatform.hash
+++ b/package/libplatform/libplatform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 94dba139066a332d048486f817736e4cf4962393c9f892d2c7dd40d9d69ca788  libplatform-1eb12b1b1efa6747c1e190964854e9e267e3a1e2.tar.gz
-sha256 80fc66febbb2393c9d518e3eefa4ad9aae15a9b6a84174c0e443ea79eeea5131  src/os.h
+sha256  209daeb87af4ca92199887eb151b2a459bb81566cdaa092644e0889afb64bf6a  libplatform-1c9d14fa996af33760a2c700caebd2bd9ae527c9.tar.gz
+sha256  80fc66febbb2393c9d518e3eefa4ad9aae15a9b6a84174c0e443ea79eeea5131  src/os.h
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index 0a4c492969..ca57a07d15 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = 1eb12b1b1efa6747c1e190964854e9e267e3a1e2
+LIBPLATFORM_VERSION = 1c9d14fa996af33760a2c700caebd2bd9ae527c9
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
 LIBPLATFORM_LICENSE = GPL-2.0+
 LIBPLATFORM_LICENSE_FILES = src/os.h
