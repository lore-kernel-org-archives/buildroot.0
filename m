From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:32:58 +0200
Subject: [Buildroot] [git commit] execline: bump version to 2.3.0.1
Message-ID: <20170702213031.72BAC803BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd4e0042d454d2d83ce73353d3a5bfe54ef0f379
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/execline/execline.hash | 2 +-
 package/execline/execline.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 61fc99c..54d9e28 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 93bd744f2e3ad204cb89f147efdc6ca4e622f9c6bfc9895e0b2cb8b0480029de execline-2.2.0.0.tar.gz
+sha256 2bf65aaaf808718952e05c2221b4e9472271e53ebd915c8d1d49a3e992583bf4  execline-2.3.0.1.tar.gz
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index ca7c73e..cc56a3a 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.2.0.0
+EXECLINE_VERSION = 2.3.0.1
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
