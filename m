From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 10:35:52 -0300
Subject: [Buildroot] [PATCH 7/8] quagga: add license information
In-Reply-To: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358861753-5990-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quagga/quagga.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.12.4
