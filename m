From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 12:34:32 +0200
Subject: [Buildroot] [PATCH 2 of 2] dhcp: install to staging
In-Reply-To: <patchbomb.1374662070@BEANTN0L019720>
References: <patchbomb.1374662070@BEANTN0L019720>
Message-ID: <6519645a6ae79b943f1d.1374662072@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install dhcp to staging so other applications can use its include files
and libraries.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/dhcp/dhcp.mk |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -6,6 +6,7 @@
 
 DHCP_VERSION = 4.1-ESV-R8
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
+DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
 DHCP_LICENSE_FILES = LICENSE
 DHCP_CONF_ENV = ac_cv_file__dev_random=yes
