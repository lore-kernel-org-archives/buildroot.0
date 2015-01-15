From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:35:13 +0100
Subject: [Buildroot] [git commit] libmbim: bump to 1.12.0
Message-ID: <20150115083519.EB26080125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1f672bfa8ba7c78f9574ae1e8efdbaba25ce0fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmbim/libmbim.hash |    2 +-
 package/libmbim/libmbim.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index ac9b70c..b082772 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  c0f6611c1ea726f8801bdf3316cf3fe31772391cd60945373c4c9d128655c7bc  libmbim-1.10.2.tar.xz
+sha256  b5b9e72d6b0a4d9e5a92b913c16426946f8f6cf60e648635306ebade44ace553  libmbim-1.12.0.tar.xz
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 07fb1b6..fa42d1d 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.10.2
+LIBMBIM_VERSION = 1.12.0
 LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
