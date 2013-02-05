From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 21:44:36 +0100
Subject: [Buildroot] [git commit] dhcp: bump to version 4.1-ESV-R8
Message-ID: <20130205204625.EB7A79A9A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af3fdf3e7b9ddff419b0834a8b07d6dd0575a637
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dhcp/dhcp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 8d90ea4..34c0afa 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DHCP_VERSION = 4.1-ESV-R7
+DHCP_VERSION = 4.1-ESV-R8
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_LICENSE = ISC
 DHCP_LICENSE_FILES = LICENSE
