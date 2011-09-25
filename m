From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 25 Sep 2011 20:48:46 +0200
Subject: [Buildroot] [git commit] acpid: bump to 2.0.11
Message-ID: <20110926052650.68EDC8DA8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da9ebfbe9c12711d9dc8561bd11c0f3ae615c61d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

acpid 2.0.6 does not compile? So bump to 2.0.11

Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
