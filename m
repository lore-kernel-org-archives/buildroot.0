From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 May 2017 17:00:33 +0100
Subject: [Buildroot] [PATCH] nano: bump version to 2.8.2
Message-ID: <20170508160033.41103-1-Vincent.Riera@imgtec.com>
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
index 12baecf..2c030a1 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 e935a8bb373345c833dff3a304c6d392775d206b94c802d9285ae80ac6b66d0b  nano-2.8.1.tar.xz
+sha256 023e8a7b38b2420d5476d7b2b4d8524d7de55c0853b4dc0b02e4a4adf7ecb9e0  nano-2.8.2.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 9e7fdc7..0f01e46 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.8
-NANO_VERSION = $(NANO_VERSION_MAJOR).1
+NANO_VERSION = $(NANO_VERSION_MAJOR).2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.10.2
