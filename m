From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2013 23:56:46 +0100
Subject: [Buildroot] [git commit] package/zic: bump
Message-ID: <20131105231347.96E019BA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=615881ff5e1a15e99396dd2615bb4ce8c415e0dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump to allign with the tzdata bump in previous commit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zic/zic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 3d56df1..780643b 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2013c
+ZIC_VERSION = 2013h
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = ftp://ftp.iana.org/tz/releases
 ZIC_LICENSE = Public domain
