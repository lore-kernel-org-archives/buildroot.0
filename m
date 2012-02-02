From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 21:01:49 +0100
Subject: [Buildroot] [git commit] libftdi: add host variant
Message-ID: <20120202201521.AC1A39099F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76cd6b18e3b6720f7dc5997dac0831ef7e62912d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove redundant HOST_LIBFTDI_DEPENDENCIES]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libftdi/libftdi.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 55481d9..d84fc32 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -21,3 +21,4 @@ LIBFDTI_CONF_OPT += --disable-libftdipp
 endif
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
