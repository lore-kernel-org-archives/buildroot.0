From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 10:47:22 +0200
Subject: [Buildroot] [git commit] quagga: bump to version 0.99.23
Message-ID: <20140708085415.EB8DD9D0C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b301e8fabf627b0d51387f251f3fb0b453ab587
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 19a6488..08f7be0 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 0.99.22.4
+QUAGGA_VERSION = 0.99.23
 QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
