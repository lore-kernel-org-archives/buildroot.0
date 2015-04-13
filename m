From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 12:26:37 +0200
Subject: [Buildroot] [git commit] libsigrok: bump commit hash
Message-ID: <20150413102655.1EC00807E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=208260982e2213f4617b7295cff7c4f502ca5814
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several patches fixing issues and adding new features to baylibre-acme
driver have been merged with upstream libsigrok.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/libsigrok.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 2d044b2..7394f64 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROK_VERSION = 380ee96fdfe0895ca0aa0b158d5c332ef08f8b3c
+LIBSIGROK_VERSION = 55462b8ba9f48931de9b9a7bfbc182a1d113b3b5
 # No https access on upstream git
 LIBSIGROK_SITE = git://sigrok.org/libsigrok
 LIBSIGROK_LICENSE = GPLv3+
