From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 17:53:52 +0200
Subject: [Buildroot] [git commit] package/tzdata: Updated TZDATA_SITE to use
	http url
Message-ID: <20151012155506.E654D81E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=082de88b5fb8fddcea714d3a162a84215cddd672
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tzdata/tzdata.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 48a0196..39fc262 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -6,7 +6,7 @@
 
 TZDATA_VERSION = 2015g
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
-TZDATA_SITE = ftp://ftp.iana.org/tz/releases
+TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
 TZDATA_DEPENDENCIES = host-tzdata
 HOST_TZDATA_DEPENDENCIES = host-zic
