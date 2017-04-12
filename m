From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:04:52 +0200
Subject: [Buildroot] [git commit] nano: bump version to 2.8.1
Message-ID: <20170412190505.DACDF7FA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e677914cd3c810f44944de20cba8d06a5dac0c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index b39d77e..12baecf 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 15c1bcf4d8888d3b56f68a0b75871cc349b81a9094f8a42d73010ffc26c85dc2  nano-2.8.0.tar.xz
+sha256 e935a8bb373345c833dff3a304c6d392775d206b94c802d9285ae80ac6b66d0b  nano-2.8.1.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 38eed0d..9e7fdc7 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.8
-NANO_VERSION = $(NANO_VERSION_MAJOR).0
+NANO_VERSION = $(NANO_VERSION_MAJOR).1
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
