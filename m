From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 17:39:36 +0200
Subject: [Buildroot] [git commit] quagga: security bump to version 0.99.22.3
Message-ID: <20130917154313.D5E609B77C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=855b21a9cc3f43979be81e054ce1eee9f9ea349a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-2236.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quagga/quagga.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 8b51917..995e42d 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 0.99.22.1
+QUAGGA_VERSION = 0.99.22.3
 QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
