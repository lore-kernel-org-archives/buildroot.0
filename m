From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Nov 2013 13:56:20 +0100
Subject: [Buildroot] [git commit] quagga: security bump to version 0.99.22.4
Message-ID: <20131127213147.6CC619BE1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50b9552a44de76815c64d95af78974bad4b780b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-6051.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 995e42d..19a6488 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 0.99.22.3
+QUAGGA_VERSION = 0.99.22.4
 QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
