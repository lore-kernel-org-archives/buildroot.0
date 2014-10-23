From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:32 +0200
Subject: [Buildroot] [PATCH 06/11] package/ccid: bump to 1.4.18,
	move download URL to snapshot.debian.org
In-Reply-To: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
References: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
Message-ID: <1414075717-7333-7-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/ccid/ccid.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index b635aa1..18653d3 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.14
-CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = http://alioth.debian.org/frs/download.php/file/3971
+CCID_VERSION = 1.4.18
+CCID_SOURCE = ccid_$(CCID_VERSION).orig.tar.bz2
+CCID_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/ccid
 CCID_LICENSE = LGPLv2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
-- 
1.7.10.4
