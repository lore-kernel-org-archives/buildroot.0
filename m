From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Dec 2017 22:23:35 +0100
Subject: [Buildroot] [git commit] msmtp: bump to version 1.6.6
Message-ID: <20171207213318.8D615801F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c8432384af2aafc3c2a67e836d01390fafbcf0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/msmtp/msmtp.hash | 9 ++++++---
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index d0de8e0..10d6cea 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,3 +1,6 @@
-# From http://sourceforge.net/projects/msmtp/files/msmtp/1.6.5/
-md5	50a8c9bb72f8222779db6b4aae2965e0	msmtp-1.6.5.tar.xz
-sha1	27d1fc609cd453a7e4c55c4ec55d455949bc53f1	msmtp-1.6.5.tar.xz
+# From http://sourceforge.net/projects/msmtp/files/msmtp/1.6.6/
+md5	82b0520b57db4b2cf05333d11fb5974d	msmtp-1.6.6.tar.xz
+sha1	f997f40dfb3f882df837cfd9a63bd4d271dcdc41	msmtp-1.6.6.tar.xz
+# Locally calculated after checking signature
+# http://downloads.sourceforge.net/project/msmtp/msmtp/1.6.6/msmtp-1.6.6.tar.xz.sig
+sha256	da15db1f62bd0201fce5310adb89c86188be91cd745b7cb3b62b81a501e7fb5e	msmtp-1.6.6.tar.xz
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 1821d39..a1bd9e1 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.6.5
+MSMTP_VERSION = 1.6.6
 MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
