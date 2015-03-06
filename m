From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 23:20:58 +0100
Subject: [Buildroot] [git commit] liburcu: bump to version 0.8.6
Message-ID: <20150306222135.B97EC81826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38a6552635e98cca09b75abc79c9f0e71cfdea20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liburcu/liburcu.hash |    4 ++++
 package/liburcu/liburcu.mk   |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
new file mode 100644
index 0000000..2b1693d
--- /dev/null
+++ b/package/liburcu/liburcu.hash
@@ -0,0 +1,4 @@
+# http://www.lttng.org/files/urcu/userspace-rcu-0.8.6.tar.bz2.sha1
+sha1  f10e9bf812557cd0c2a35a277e04010ec278d25d  userspace-rcu-0.8.6.tar.bz2
+# Locally generated
+sha256 b1a5d3bce014ba7a702759bc60b692c1cd46ff0e8a5b53f0d0a95e22db74ab21 userspace-rcu-0.8.6.tar.bz2
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index c48f659..1582d07 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.8.4
+LIBURCU_VERSION = 0.8.6
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
