From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Sun, 14 Aug 2011 16:08:08 +0200
Subject: [Buildroot] [PATCH] acpid: bump to 2.0.11
Message-ID: <20110814160808.53d3acb6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

acpid 2.0.6 does not compile? So bump to 2.0.11

Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
---
 package/acpid/acpid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index d61ca41..cc4e45b 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -3,7 +3,7 @@
 # acpid
 #
 #############################################################
-ACPID_VERSION = 2.0.6
+ACPID_VERSION = 2.0.11
 ACPID_SOURCE = acpid_$(ACPID_VERSION).orig.tar.gz
 ACPID_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
 
-- 
1.7.2.3
