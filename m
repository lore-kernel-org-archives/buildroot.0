From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Sep 2013 14:29:53 +0200
Subject: [Buildroot] [git commit] neard: bump version to 0.13
Message-ID: <20130924124312.59AC19B861@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9f6011617528646768e69203e85fe64364b7efd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neard/neard.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 6dbbbe0..0f954b8 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARD_VERSION = 0.12
+NEARD_VERSION = 0.13
 NEARD_SOURCE = neard-$(NEARD_VERSION).tar.xz
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPLv2
