From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 14:05:29 +0100
Subject: [Buildroot] [git commit] patch: bump to version 2.7.5
Message-ID: <20150309130534.E4E52803D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1eaf45fc6cc2ac395c5f8dc5690bf4628cd25ecd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/patch/patch.hash |    2 +-
 package/patch/patch.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/patch/patch.hash b/package/patch/patch.hash
index 7f1b024..d6e3a2d 100644
--- a/package/patch/patch.hash
+++ b/package/patch/patch.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d09022de9d629561bf4dad44625ef4b1ead15178b210412113531730cdb6f19d	patch-2.7.3.tar.xz
+sha256	fd95153655d6b95567e623843a0e77b81612d502ecf78a489a4aed7867caa299	patch-2.7.5.tar.xz
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 4fa0e41..765dfa9 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PATCH_VERSION = 2.7.3
+PATCH_VERSION = 2.7.5
 PATCH_SOURCE = patch-$(PATCH_VERSION).tar.xz
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPLv3+
