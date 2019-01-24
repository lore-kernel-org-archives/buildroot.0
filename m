From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:27:02 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] patchelf: update _SITE to
 new location
Message-ID: <20190124152628.264E682B3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8175f6e88940dd0f18b5539a6a00be8db7773118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

releases.nixos.org gives some weird XML pages. The upstream location is
nixos.org/releases.

This side uses HSTS, so switch to https to avoid a needless redirect.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e2fa462426bbcc3b4d443f64139a039f1945d4f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/patchelf/patchelf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index 74e6cccdbe..52912e295b 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PATCHELF_VERSION = 0.9
-PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-$(PATCHELF_VERSION)
+PATCHELF_SITE = https://nixos.org/releases/patchelf/patchelf-$(PATCHELF_VERSION)
 PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
 PATCHELF_LICENSE = GPL-3.0+
 PATCHELF_LICENSE_FILES = COPYING
