From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 14:49:55 +0200
Subject: [Buildroot] [git commit] dhcp: install to staging
Message-ID: <20130727130650.2A9AA9AA61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8891dedb09a47a2cfd056fa81f8f945ac73cf08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install dhcp to staging so other applications can use its include files
and libraries.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/dhcp.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 3baeb23..3885bba 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -6,6 +6,7 @@
 
 DHCP_VERSION = 4.1-ESV-R8
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
+DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
 DHCP_LICENSE_FILES = LICENSE
 DHCP_CONF_ENV = ac_cv_file__dev_random=yes
