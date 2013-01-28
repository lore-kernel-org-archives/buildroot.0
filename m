From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 23:31:21 +0100
Subject: [Buildroot] [git commit] sdparm: add license information
Message-ID: <20130128223359.C2C0681D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a52cda9bd494f6a2530752b2d97199cd7891b69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdparm/sdparm.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index b251b3c..ef30887 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -1,5 +1,7 @@
 SDPARM_VERSION = 1.07
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
 SDPARM_SITE = http://sg.danny.cz/sg/p/
+SDPARM_LICENSE = BSD-3c
+SDPARM_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
