From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 17:43:39 +0100
Subject: [Buildroot] [git commit] start-stop-daemon: bump to version 1.18.4
Message-ID: <20151228164406.585F582563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=884558928b04ecd01f75a8603e50a3cdcf967b0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
