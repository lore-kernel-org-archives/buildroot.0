From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Dec 2015 09:35:40 -0300
Subject: [Buildroot] [PATCH] start-stop-daemon: bump to version 1.18.4
Message-ID: <1451306140-9468-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/start-stop-daemon/start-stop-daemon.hash | 4 ++--
 package/start-stop-daemon/start-stop-daemon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/start-stop-daemon/start-stop-daemon.hash b/package/start-stop-daemon/start-stop-daemon.hash
index 295c2ff..a05b9a0 100644
--- a/package/start-stop-daemon/start-stop-daemon.hash
+++ b/package/start-stop-daemon/start-stop-daemon.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.18.3.dsc
-sha256	a40ffe38d7f36d858a752189a306433cfc52c7d15d7b98f61d9f9dd49e0e4807	dpkg_1.18.3.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.18.4.dsc
+sha256	fe89243868888ce715bf45861f26264f767d4e4dbd0d6f1a26ce60bbbbf106da	dpkg_1.18.4.tar.xz
diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
index a38f927..e0ef6c9 100644
--- a/package/start-stop-daemon/start-stop-daemon.mk
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -7,9 +7,9 @@
 # Debian start-stop-daemon is part of dpkg. Since start-stop-daemon is the only
 # interesting tool in it, we call the buildroot package start-stop-daemon.
 
-START_STOP_DAEMON_VERSION = 1.18.3
+START_STOP_DAEMON_VERSION = 1.18.4
 START_STOP_DAEMON_SOURCE = dpkg_$(START_STOP_DAEMON_VERSION).tar.xz
-START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20150921T092814Z/pool/main/d/dpkg
+START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20151225T154922Z/pool/main/d/dpkg
 START_STOP_DAEMON_CONF_OPTS = \
 	--disable-dselect \
 	--disable-update-alternatives \
-- 
2.4.10
