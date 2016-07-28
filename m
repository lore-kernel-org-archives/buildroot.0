From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 28 Jul 2016 13:25:43 +0100
Subject: [Buildroot] [PATCH] nano: bump version to 2.6.2
Message-ID: <1469708743-45205-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index a07a969..40a6942 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 45721fa6d6128068895ad71a6967ff7398d11b064b3f888e5073c97a2b6e9a81  nano-2.6.1.tar.xz
+sha256 22f79cc635458e0c0d110d211576f1edc03b112a62d73b914826a46547a6ac27  nano-2.6.2.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index f01745d..7800b58 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.6
-NANO_VERSION = $(NANO_VERSION_MAJOR).1
+NANO_VERSION = $(NANO_VERSION_MAJOR).2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPLv3+
-- 
2.7.3
