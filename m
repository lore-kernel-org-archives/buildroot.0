From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 23:31:47 +0100
Subject: [Buildroot] [git commit] quagga: add license information
Message-ID: <20130128223400.5DDED9A864@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dedd61c471d129796951f55371d0f3bea61cdb27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quagga/quagga.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index da022c3..fb060ef 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -7,6 +7,8 @@
 QUAGGA_VERSION = 0.99.21
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
+QUAGGA_LICENSE = GPLv2+
+QUAGGA_LICENSE_FILES = COPYING
 QUAGGA_CONF_OPT = --program-transform-name='' --enable-netlink
 
 QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-zebra)
