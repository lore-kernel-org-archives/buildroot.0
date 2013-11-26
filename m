From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Nov 2013 16:06:52 +0100
Subject: [Buildroot] [git commit] ulogd: bump to version 2.0.3
Message-ID: <20131201201520.2942F9BE44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8984eeaf2cf2fae608c43e00417b24f7c6936f16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ulogd/ulogd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 11780ac..24a5838 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ULOGD_VERSION = 2.0.2
+ULOGD_VERSION = 2.0.3
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
 ULOGD_CONF_OPT = --with-dbi=no --with-pgsql=no
