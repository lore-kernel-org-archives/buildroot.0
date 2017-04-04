From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 13:01:46 +0200
Subject: [Buildroot] [git commit] nano: bump version to 2.8.0
Message-ID: <20170404110157.E0AC9826F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2706f875ba27650f2c3ec1cbe09eeb6d0db91df6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index aa3e27b..b39d77e 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 752170643039e2c95a433de357f0c70a8c4c4c561a90a7e7259a63e225b659b9  nano-2.7.4.tar.xz
+sha256 15c1bcf4d8888d3b56f68a0b75871cc349b81a9094f8a42d73010ffc26c85dc2  nano-2.8.0.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index c20e231..38eed0d 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 2.7
-NANO_VERSION = $(NANO_VERSION_MAJOR).4
+NANO_VERSION_MAJOR = 2.8
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
