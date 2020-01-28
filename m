From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 23:20:40 +0100
Subject: [Buildroot] [git commit] package/axel: bump to version 2.17.7
Message-ID: <20200128221533.1F98D8404C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8389e47de7909bb8ef2d4458aa312190226566de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/axel/axel.hash | 3 +--
 package/axel/axel.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index f9c5526f88..9d1aecc4d9 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,3 +1,2 @@
-# locally computed
-sha256 24ab549021bdfca01ad5e8e95b706869dd30fe9ab1043da4cbb9dff89edc267d  axel-2.17.6.tar.xz
+sha256 b700b299fc8a369352a4672560ba833335142a6bfd280d5ccdc66dc2fa6bff86  axel-2.17.7.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index d37eb4b5b2..b7ec2efb60 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.17.6
+AXEL_VERSION = 2.17.7
 AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
