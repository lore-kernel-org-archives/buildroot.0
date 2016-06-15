From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 09:45:19 +0200
Subject: [Buildroot] [git commit] start-stop-daemon: bump to version 1.18.7
Message-ID: <20160615074640.8B7EC81FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d01c15c55ac6dda5c169a9d9cca4cac10852a7bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/start-stop-daemon/start-stop-daemon.hash | 4 ++--
 package/start-stop-daemon/start-stop-daemon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/start-stop-daemon/start-stop-daemon.hash b/package/start-stop-daemon/start-stop-daemon.hash
index a05b9a0..18a1948 100644
--- a/package/start-stop-daemon/start-stop-daemon.hash
+++ b/package/start-stop-daemon/start-stop-daemon.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.18.4.dsc
-sha256	fe89243868888ce715bf45861f26264f767d4e4dbd0d6f1a26ce60bbbbf106da	dpkg_1.18.4.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.18.7.dsc
+sha256	ace36d3a6dc750a42baf797f9e75ec580a21f92bb9ff96b482100755d6d9b87b	dpkg_1.18.7.tar.xz
diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
index e0ef6c9..d849bad 100644
--- a/package/start-stop-daemon/start-stop-daemon.mk
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -7,9 +7,9 @@
 # Debian start-stop-daemon is part of dpkg. Since start-stop-daemon is the only
 # interesting tool in it, we call the buildroot package start-stop-daemon.
 
-START_STOP_DAEMON_VERSION = 1.18.4
+START_STOP_DAEMON_VERSION = 1.18.7
 START_STOP_DAEMON_SOURCE = dpkg_$(START_STOP_DAEMON_VERSION).tar.xz
-START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20151225T154922Z/pool/main/d/dpkg
+START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/d/dpkg
 START_STOP_DAEMON_CONF_OPTS = \
 	--disable-dselect \
 	--disable-update-alternatives \
