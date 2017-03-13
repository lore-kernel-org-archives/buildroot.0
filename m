From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 11:50:30 +0000
Subject: [Buildroot] [PATCH] nano: bump version to 2.7.5
Message-ID: <20170313115030.16340-1-Vincent.Riera@imgtec.com>
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
index aa3e27b..6264faa 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 752170643039e2c95a433de357f0c70a8c4c4c561a90a7e7259a63e225b659b9  nano-2.7.4.tar.xz
+sha256 a64d24e6bc4fc448376d038f9a755af77f8e748c9051b6f45bf85e783a7e67e4  nano-2.7.5.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 4632bed..dc6aa13 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.7
-NANO_VERSION = $(NANO_VERSION_MAJOR).4
+NANO_VERSION = $(NANO_VERSION_MAJOR).5
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPLv3+
-- 
2.10.2
