From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:04:15 +0100
Subject: [Buildroot] [git commit branch/next] libsigrok: bump git commit tag
Message-ID: <20150220180427.947347FC09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=503a6b2271499adc6da1e4f6c558c241d4036259
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/libsigrok.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index d19c3c8..6bc210e 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROK_VERSION = 8656a71790133d4de42252a1e75b4209c03b4983
+LIBSIGROK_VERSION = 380ee96fdfe0895ca0aa0b158d5c332ef08f8b3c
 # No https access on upstream git
 LIBSIGROK_SITE = git://sigrok.org/libsigrok
 LIBSIGROK_LICENSE = GPLv3+
