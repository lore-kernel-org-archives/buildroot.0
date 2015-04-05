From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 17:26:12 +0200
Subject: [Buildroot] [git commit] drbd-utils: add dependency on host-flex
Message-ID: <20150405152632.330E88191F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e339f7eb39ccab8128e945927bbb99af065a0df2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/d8c/d8cbb888787401ddefadaea8dd239a651f3dbff1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/drbd-utils/drbd-utils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 0da4b1f..5df5b81 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -8,6 +8,7 @@ DRBD_UTILS_VERSION = 8.9.1
 DRBD_UTILS_SITE = http://oss.linbit.com/drbd/
 DRBD_UTILS_LICENSE = GPLv2+
 DRBD_UTILS_LICENSE_FILES = COPYING
+DRBD_UTILS_DEPENDENCIES = host-flex
 
 DRBD_UTILS_CONF_OPTS = --with-distro=generic
 
