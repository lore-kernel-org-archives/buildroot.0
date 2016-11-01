From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 14:58:35 +0100
Subject: [Buildroot] [git commit] nano: bump version to 2.7.1
Message-ID: <20161101140028.94B25817FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91081e2a6b8e0cc68de7ad1e41cb1fd06de7c0f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index fc628eb..cb411b7 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 f86af39514ae74e20bef3c29cd01d1090a9aca772a70e9c9f9e70c3d14b39521  nano-2.7.0.tar.xz
+sha256 df5cbe69831d7394c0a32fb27373ab313335ea4dc586d6f4be4081eb1de857cd  nano-2.7.1.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 984a5fc..88e3cdb 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.7
-NANO_VERSION = $(NANO_VERSION_MAJOR).0
+NANO_VERSION = $(NANO_VERSION_MAJOR).1
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPLv3+
