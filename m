From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 21:07:40 +0200
Subject: [Buildroot] [git commit] nano: bump version to 2.7.0
Message-ID: <20160905190813.3E61D7F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c58e8747583cb0ace55e81354a5e949c030ea90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 40a6942..fc628eb 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 22f79cc635458e0c0d110d211576f1edc03b112a62d73b914826a46547a6ac27  nano-2.6.2.tar.xz
+sha256 f86af39514ae74e20bef3c29cd01d1090a9aca772a70e9c9f9e70c3d14b39521  nano-2.7.0.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 7800b58..984a5fc 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 2.6
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION_MAJOR = 2.7
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPLv3+
