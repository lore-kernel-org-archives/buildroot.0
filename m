From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 17:53:48 +0200
Subject: [Buildroot] [git commit] package/zic: Updated ZIC_SITE to use http
	url
Message-ID: <20151012155506.D5A1181E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=baa3650c7ef4931b89fe39ea2f85a0304fe173be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zic/zic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 0bcb800..fcc0288 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -6,7 +6,7 @@
 
 ZIC_VERSION = 2015g
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
-ZIC_SITE = ftp://ftp.iana.org/tz/releases
+ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
 ZIC_LICENSE = Public domain
 
