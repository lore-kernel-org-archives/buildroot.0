From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 21:50:41 +0100
Subject: [Buildroot] [git commit] libqmi: bump to 1.12.2
Message-ID: <20150203205150.A4A6F80E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12c4db998db5e8192ebab04575e2addf49cb0efc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libqmi/libqmi.hash |    2 +-
 package/libqmi/libqmi.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index df592b1..f5f2578 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  7bf0a5b70a6e8214932ec32c264e59d5290c6bd181fa1341c028a063181f64ff  libqmi-1.12.0.tar.xz
+sha256  d1661d73b510482b29b93b7e396756c433d35360b3d44c72afa7921339a98624  libqmi-1.12.2.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 7ef1dcf..9e5f9cb 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.12.0
+LIBQMI_VERSION = 1.12.2
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
