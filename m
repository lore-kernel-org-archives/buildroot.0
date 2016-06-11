From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:42:49 +0200
Subject: [Buildroot] [git commit] package/eudev: bump version to 3.2
Message-ID: <20160611144303.9000081D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3240f59e96f515d3dbec173fbc796aa1ae30d027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/eudev.hash | 4 ++--
 package/eudev/eudev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index e7c331c..44ed169 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,4 +1,4 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5	c4dace42deecede102b6c01904042acc	eudev-3.1.5.tar.gz
+md5	7e42d9b9ed8162021665139520676367	eudev-3.2.tar.gz
 # Locally calculated
-sha256	f75885a430cd50fe4b31732f808ba7f9b2adf0f26b53b8ba2957b0c1d84b6f2a	eudev-3.1.5.tar.gz
+sha256	d84a5f7942393a009afc6af0bf31e98841147a0521b91ffbed161dccac303c25	eudev-3.2.tar.gz
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 942770c..4818ea5 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.1.5
+EUDEV_VERSION = 3.2
 EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
