From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 22 May 2017 10:06:51 +0100
Subject: [Buildroot] [PATCH next] nano: bump version to 2.8.4
Message-ID: <20170522090651.10582-1-Vincent.Riera@imgtec.com>
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
index 2c030a10b..dfc660336 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 023e8a7b38b2420d5476d7b2b4d8524d7de55c0853b4dc0b02e4a4adf7ecb9e0  nano-2.8.2.tar.xz
+sha256 c7cf264f0f3e4af43ecdbc4ec72c3b1e831c69a1a5f6512d5b0c109e6bac7b11  nano-2.8.4.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 0f01e4671..966d43b53 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.8
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION = $(NANO_VERSION_MAJOR).4
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.13.0
