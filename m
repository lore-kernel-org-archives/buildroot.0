From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:10:02 +0200
Subject: [Buildroot] [git commit] package/libserialport: bump to latest
	commit
Message-ID: <20150730211931.4577B80720@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac73040ea22f6668590be793ff2ddb0a534f43aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous commit e31f2c6b8b8f2b7e554df911cc9a3482b99632b4 is from Dec 5 2014.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libserialport/libserialport.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libserialport/libserialport.mk b/package/libserialport/libserialport.mk
index 2e57653..3dcbccb 100644
--- a/package/libserialport/libserialport.mk
+++ b/package/libserialport/libserialport.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSERIALPORT_VERSION = e31f2c6b8b8f2b7e554df911cc9a3482b99632b4
+LIBSERIALPORT_VERSION = f77bb46df5d883527da8b7eb4a5328ea7e990dbb
 # No https access on upstream git
 LIBSERIALPORT_SITE = git://sigrok.org/libserialport
 LIBSERIALPORT_LICENSE = LGPLv3+
