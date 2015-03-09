From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Mar 2015 09:50:52 -0300
Subject: [Buildroot] [PATCH] patch: bump to version 2.7.5
Message-ID: <1425905452-16084-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/patch/patch.hash | 2 +-
 package/patch/patch.mk   | 2 +-
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
-- 
2.0.5
