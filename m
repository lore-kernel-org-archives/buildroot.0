From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 02 Mar 2016 20:27:53 -0000
Subject: [Buildroot] [git commit] libqmi: bump to 1.12.8
Message-ID: <20160302202751.CD12780203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a041c6e3747bdf9d64f61300cf0a1d067053fef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index a2c37d3..df0bb0b 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  0857bffece4e8ddfa7f721dd9ca63b4c78de345ac9ae2faebf04062cacba3780  libqmi-1.12.6.tar.xz
+sha256  d23a397d9c963f637c99622df74ed08a2ba2276552c21eea1ed1d05eeafc82a7  libqmi-1.12.8.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 1bc6121..0ff20a6 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.12.6
+LIBQMI_VERSION = 1.12.8
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
