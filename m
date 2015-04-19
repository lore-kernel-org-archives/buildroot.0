From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:13:54 +0200
Subject: [Buildroot] [PATCH 01/10] package/memstat: bump version to 1.0,
	add hash
Message-ID: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change upstream URL to sourceforge and add it to Config.in

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/memstat/Config.in    |    2 ++
 package/memstat/memstat.hash |    2 ++
 package/memstat/memstat.mk   |    4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 package/memstat/memstat.hash

diff --git a/package/memstat/Config.in b/package/memstat/Config.in
index ca34ea3..b790612 100644
--- a/package/memstat/Config.in
+++ b/package/memstat/Config.in
@@ -5,3 +5,5 @@ config BR2_PACKAGE_MEMSTAT
 	  libraries that are using up virtual memory. It's helpful to
 	  see how the shared memory is used and which 'old' libs are
 	  loaded.
+
+	  http://sourceforge.net/projects/memstattool
diff --git a/package/memstat/memstat.hash b/package/memstat/memstat.hash
new file mode 100644
index 0000000..f27e7d2
--- /dev/null
+++ b/package/memstat/memstat.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/memstattool/files/
+sha1	26071dbc30a2796c0503c7d8060a548ca36f8df9	memstat_1.0.tar.gz
diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 074e985..7ee4d60 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MEMSTAT_VERSION = 0.8
-MEMSTAT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/m/memstat
+MEMSTAT_VERSION = 1.0
+MEMSTAT_SITE = http://downloads.sourceforge.net/project/memstattool
 MEMSTAT_SOURCE = memstat_$(MEMSTAT_VERSION).tar.gz
 MEMSTAT_LICENSE = GPL
 MEMSTAT_LICENSE_FILES = debian/copyright
-- 
1.7.10.4
