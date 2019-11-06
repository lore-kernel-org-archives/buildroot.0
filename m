From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 22:58:27 +0100
Subject: [Buildroot] [git commit] package/ofono: bump to version 1.31
Message-ID: <20191106215215.0265E8E91F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8e7ac608326c9b5db0b818b7fd8c661ba536711
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release. From the ChangeLog:

Ver 1.31:
 - Fix issue with handling CID 0 context identifier.
 - Fix issue with handling detach state and running LTE.
 - Fix issue with handling SIM states and Quectel modems.

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ofono/ofono.hash | 2 +-
 package/ofono/ofono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index e8e972af21..02245a46f4 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256 8079735efc5d7f33be9e792e791f2f7ff75c31ce67d477b994673e32319eec5c  ofono-1.30.tar.xz
+sha256 a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b69624f33d859e9b  ofono-1.31.tar.xz
 # Locally computed
 sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 18248b50d1..0765ff97c1 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.30
+OFONO_VERSION = 1.31
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
