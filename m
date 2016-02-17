From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 21:31:21 +0100
Subject: [Buildroot] [git commit] usbredir: bump to version 0.7.1
Message-ID: <20160302202752.B015C80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2eee4170bea5f9d42b2a0bb6f4e7f39f216c8f96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbredir/usbredir.hash | 2 +-
 package/usbredir/usbredir.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index 8328bb5..9ba1177 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 028184960044ea4124030000b3c55a35c3238835116e3a0fbcaff449df2c8edf usbredir-0.6.tar.bz2
+sha256 407e9e27a1369f01264d5501ffbe88935ddd7d5de675f5835db05dc9c9ac56f3 usbredir-0.7.1.tar.bz2
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index dc87321..926a1ff 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.6
+USBREDIR_VERSION = 0.7.1
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.bz2
 USBREDIR_SITE = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPLv2.1+
