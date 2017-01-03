From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 16:25:22 +0100
Subject: [Buildroot] [git commit] m4: bump to version 1.4.18
Message-ID: <20170103152906.B9A507FB3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2895cf76404890cea487cf450b09b9f556cef964
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/m4/m4.hash | 2 +-
 package/m4/m4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/m4/m4.hash b/package/m4/m4.hash
index 38214dc..79c36c8 100644
--- a/package/m4/m4.hash
+++ b/package/m4/m4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	f0543c3beb51fa6b3337d8025331591e0e18d8ec2886ed391f1aade43477d508	m4-1.4.17.tar.xz
+sha256	f2c1e86ca0a404ff281631bdc8377638992744b175afb806e25871a24a934e07	m4-1.4.18.tar.xz
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 9b5d2d1..d53f7cb 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-M4_VERSION = 1.4.17
+M4_VERSION = 1.4.18
 M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPLv3+
