From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 31 Oct 2016 16:31:24 +0000
Subject: [Buildroot] [PATCH 2/3] nano: bump version to 2.7.1
In-Reply-To: <20161031163125.14131-1-Vincent.Riera@imgtec.com>
References: <20161031163125.14131-1-Vincent.Riera@imgtec.com>
Message-ID: <20161031163125.14131-2-Vincent.Riera@imgtec.com>
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
-- 
2.10.1
