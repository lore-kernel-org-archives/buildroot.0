From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 23:49:02 +0100
Subject: [Buildroot] [git commit] popt: add host variant for
	host-lttng-babeltrace
Message-ID: <20120131232309.DE6AA90953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b6e0c8204c64868d656e35ba25dd5e2bf1bf7ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/popt/popt.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 98f438d..fd25caa 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -16,3 +16,4 @@ POPT_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
 endif
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
