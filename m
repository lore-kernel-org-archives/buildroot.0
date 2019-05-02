From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 May 2019 08:35:58 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/netcat-openbsd:
 switch to new upstream URL
Message-ID: <20190502063316.65E9F81213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63b3643ed5d9708d4836905e9897837c318e306e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

anonscm.debian.org has been discontinued and now hosts a page pointing
to salsa.debian.org.  Switch to the new upstream URL, explicitly setting
the method to git now that we use an HTTPS URL.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 14839eca9a635c1ef2452f0c96614c8c273e9f72)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netcat-openbsd/netcat-openbsd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index e98b479c4f..b313116b3f 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 NETCAT_OPENBSD_VERSION = debian/1.190-1
-NETCAT_OPENBSD_SITE = git://anonscm.debian.org/collab-maint/netcat-openbsd
+NETCAT_OPENBSD_SITE = https://salsa.debian.org/debian/netcat-openbsd.git
+NETCAT_OPENBSD_SITE_METHOD = git
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
