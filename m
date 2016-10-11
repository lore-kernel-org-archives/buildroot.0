From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2016 11:23:00 +0200
Subject: [Buildroot] [git commit] start-stop-daemon: bump to version 1.8.10
Message-ID: <20161011092323.E81E0821D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6bb41c4ed413c7e190460b18277783420f4e6f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/start-stop-daemon/start-stop-daemon.hash | 4 ++--
 package/start-stop-daemon/start-stop-daemon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/start-stop-daemon/start-stop-daemon.hash b/package/start-stop-daemon/start-stop-daemon.hash
index 18a1948..7ce6cc3 100644
--- a/package/start-stop-daemon/start-stop-daemon.hash
+++ b/package/start-stop-daemon/start-stop-daemon.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.18.7.dsc
-sha256	ace36d3a6dc750a42baf797f9e75ec580a21f92bb9ff96b482100755d6d9b87b	dpkg_1.18.7.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.18.10.dsc
+sha256	025524da41ba18b183ff11e388eb8686f7cc58ee835ed7d48bd159c46a8b6dc5	dpkg_1.18.10.tar.xz
diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
index d849bad..5aac541 100644
--- a/package/start-stop-daemon/start-stop-daemon.mk
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -7,9 +7,9 @@
 # Debian start-stop-daemon is part of dpkg. Since start-stop-daemon is the only
 # interesting tool in it, we call the buildroot package start-stop-daemon.
 
-START_STOP_DAEMON_VERSION = 1.18.7
+START_STOP_DAEMON_VERSION = 1.18.10
 START_STOP_DAEMON_SOURCE = dpkg_$(START_STOP_DAEMON_VERSION).tar.xz
-START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/d/dpkg
+START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20160731T221931Z/pool/main/d/dpkg
 START_STOP_DAEMON_CONF_OPTS = \
 	--disable-dselect \
 	--disable-update-alternatives \
