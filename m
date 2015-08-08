From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:25 -0000
Subject: [Buildroot] [git commit branch/next] libsigrok: bump commit hash
Message-ID: <20150808105616.AC66F7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fd3caec0648bcd96bb24f6c08861307f96ecd88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/libsigrok.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 21d8259..54d0482 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROK_VERSION = 55462b8ba9f48931de9b9a7bfbc182a1d113b3b5
+LIBSIGROK_VERSION = fe473123ba836445d477149f2e2c0ae372fc0c4c
 # No https access on upstream git
 LIBSIGROK_SITE = git://sigrok.org/libsigrok
 LIBSIGROK_LICENSE = GPLv3+
