From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Dec 2014 21:56:54 +0100
Subject: [Buildroot] [git commit] ympd: fix license typo
Message-ID: <20141219210206.860547FD99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6af6eecd9db3772b300724b5cb5650012c129313
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ympd/ympd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
index 2898c9d..346c510 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -7,7 +7,7 @@
 YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
 YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
 YMPD_LICENSE = GPLv2
-YMPD_LICENSE_FILE = LICENSE
+YMPD_LICENSE_FILES = LICENSE
 YMPD_DEPENDENCIES = libmpdclient
 
 define YMPD_MAKE_HOST_TOOL
