From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:26:46 +0200
Subject: [Buildroot] [git commit] pulseview: bump commit hash
Message-ID: <20150630122721.6E52E7FAED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78214851f34acd3574454728393bc5aafbbae2a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include commit ec6cc07f which fixes an issue causing build failures
on several architectures.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseview/pulseview.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
index 1c0e819..67f293f 100644
--- a/package/pulseview/pulseview.mk
+++ b/package/pulseview/pulseview.mk
@@ -8,7 +8,7 @@
 
 # No https access on upstream git
 PULSEVIEW_SITE = git://sigrok.org/pulseview
-PULSEVIEW_VERSION = 198f9bc74d6c955a72e3e3282c2b0ba16ef39a62
+PULSEVIEW_VERSION = ec6cc07fed12f5070eee6b8cb11343e83d42533c
 PULSEVIEW_LICENSE = GPLv3+
 PULSEVIEW_LICENSE_FILES = COPYING
 PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
