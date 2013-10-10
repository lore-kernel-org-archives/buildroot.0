From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Oct 2013 23:01:03 +0200
Subject: [Buildroot] [git commit] chrony: bump to version 1.29
Message-ID: <20131010211037.52BBD9A139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbcbed4a24a8fd9b8a1f9c546cb43e56ae961bc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 59fd3cb..f000e4a 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 1.27
+CHRONY_VERSION = 1.29
 CHRONY_SITE = http://download.tuxfamily.org/chrony/
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
