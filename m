From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 22:50:29 +0100
Subject: [Buildroot] [git commit] libmpdclient: add host-meson dependency
Message-ID: <20180309215351.354D08289C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf69551e941b530ad84b1ec7995041c7ad86ae3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/00a/00af3302c4029670a585beb3cb65bd8623cf12da

Add a libmpdclient entry for myself in DEVELOPERS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                           | 1 +
 package/libmpdclient/libmpdclient.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dba0e58757..78a0721201 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -652,6 +652,7 @@ F:	package/gupnp-dlna/
 F:	package/gupnp-tools/
 F:	package/hiredis/
 F:	package/igd2-for-linux/
+F:	package/libmpdclient/
 F:	package/libupnp/
 F:	package/libupnp18/
 F:	package/minissdpd/
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 5574bde948..3148fd2873 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -11,6 +11,7 @@ LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_
 LIBMPDCLIENT_INSTALL_STAGING = YES
 LIBMPDCLIENT_LICENSE = BSD-3-Clause
 LIBMPDCLIENT_LICENSE_FILES = COPYING
+LIBMPDCLIENT_DEPENDENCIES = host-meson
 
 LIBMPDCLIENT_CONF_OPTS += \
 	--prefix=/usr \
