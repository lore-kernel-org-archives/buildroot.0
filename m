From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 12:26:49 +0200
Subject: [Buildroot] [git commit] pulseview: bump commit hash
Message-ID: <20150413102655.31B8B807E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edbeeeff57d1960c5568c879c134e11a719ecae3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make recently merged new option bindings available to users of pulseview.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseview/pulseview.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
index 9e22d3f..1c0e819 100644
--- a/package/pulseview/pulseview.mk
+++ b/package/pulseview/pulseview.mk
@@ -8,7 +8,7 @@
 
 # No https access on upstream git
 PULSEVIEW_SITE = git://sigrok.org/pulseview
-PULSEVIEW_VERSION = 19be0af16af83ca10f7ce69cb64f0b0c6f6a0d81
+PULSEVIEW_VERSION = 198f9bc74d6c955a72e3e3282c2b0ba16ef39a62
 PULSEVIEW_LICENSE = GPLv3+
 PULSEVIEW_LICENSE_FILES = COPYING
 PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
