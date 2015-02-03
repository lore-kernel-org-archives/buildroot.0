From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue,  3 Feb 2015 21:27:07 +0100
Subject: [Buildroot] [PATCH 2/2] libmbim: bump to 1.12.2
In-Reply-To: <1422995227-9507-1-git-send-email-yegorslists@googlemail.com>
References: <1422995227-9507-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1422995227-9507-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index b082772..f066e96 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  b5b9e72d6b0a4d9e5a92b913c16426946f8f6cf60e648635306ebade44ace553  libmbim-1.12.0.tar.xz
+sha256  949351d3e3d69b81e40a49f1d187944c26149e0647a415f0227ccdc112047b29  libmbim-1.12.2.tar.xz
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index fa42d1d..8d49f28 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.12.0
+LIBMBIM_VERSION = 1.12.2
 LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
2.1.0
