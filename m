From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 23:32:19 +0200
Subject: [Buildroot] [git commit] netcat-openbsd: fix license typo
Message-ID: <20150602213355.A8E5E80D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e00f6846ae14bd2b77560aa3f4e50f67d73c862
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netcat-openbsd/netcat-openbsd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index bf5c4b7..5abfc7e 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -7,7 +7,7 @@
 NETCAT_OPENBSD_VERSION = debian/1.105-7
 NETCAT_OPENBSD_SITE = git://anonscm.debian.org/collab-maint/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3c
-NETCAT_OPENBSD_LICENSE_FILE = debian/copyright
+NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
 
 # Ensure Busybox gets built/installed before, so that this package
