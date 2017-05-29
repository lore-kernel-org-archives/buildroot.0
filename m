From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 21:46:45 +0200
Subject: [Buildroot] [git commit] package/stella: fix project URLs
Message-ID: <20170529194801.D388782795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=621408e59559058aa448c740119e467d5c168b68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project moved to github: http://stella.sourceforge.net/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stella/Config.in | 2 +-
 package/stella/stella.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stella/Config.in b/package/stella/Config.in
index dd8e32a..4c10983 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_STELLA
 	help
 	  Stella is a multi-platform Atari 2600 VCS emulator.
 
-	  http://stella.sourceforge.net/
+	  https://stella-emu.github.io/
 
 comment "stella needs a toolchain w/ dynamic library, C++, gcc >= 4.8"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 220abb2..fbf7809 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -6,7 +6,7 @@
 
 STELLA_VERSION = 4.7.2
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
-STELLA_SITE = http://downloads.sourceforge.net/stella
+STELLA_SITE = https://github.com/stella-emu/stella/releases/download/release-$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
 STELLA_LICENSE_FILES = Copyright.txt License.txt
 
