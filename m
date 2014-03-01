From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 14:42:46 +0100
Subject: [Buildroot] [git commit] grep: bump version to 2.18
Message-ID: <20140301134259.0094E9BAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d281b289c2ac39860d55b45f6e273b9c817d15e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Tam??s L??vai <levai.tamas@t-online.hu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grep/grep.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index ee6de39..78e60dc 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.16
+GREP_VERSION = 2.18
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
