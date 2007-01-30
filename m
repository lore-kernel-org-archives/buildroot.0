From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 16:35:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20070130003540.ED17348594@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 16:35:40 -0800 (Mon, 29 Jan 2007)
New Revision: 17663

Log:
- drop some stuff


Modified:
   trunk/buildroot/target/device/x86/i386/busybox.config


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/busybox.config
===================================================================
--- trunk/buildroot/target/device/x86/i386/busybox.config	2007-01-30 00:12:17 UTC (rev 17662)
+++ trunk/buildroot/target/device/x86/i386/busybox.config	2007-01-30 00:35:40 UTC (rev 17663)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Busybox version: 1.5.0.svn
-# Tue Jan 30 00:55:45 2007
+# Tue Jan 30 01:32:00 2007
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -61,7 +61,7 @@
 CONFIG_INSTALL_APPLET_SYMLINKS=y
 # CONFIG_INSTALL_APPLET_HARDLINKS is not set
 # CONFIG_INSTALL_APPLET_DONT is not set
-CONFIG_PREFIX="/home/cow/src/buildroot.arm/build_i686/root"
+CONFIG_PREFIX="./_install"
 
 #
 # Busybox Library Tuning
@@ -71,7 +71,7 @@
 # CONFIG_FEATURE_EDITING is not set
 # CONFIG_FEATURE_EDITING_FANCY_KEYS is not set
 # CONFIG_FEATURE_EDITING_VI is not set
-CONFIG_FEATURE_EDITING_HISTORY=0
+CONFIG_FEATURE_EDITING_HISTORY=
 # CONFIG_FEATURE_EDITING_SAVEHISTORY is not set
 # CONFIG_FEATURE_TAB_COMPLETION is not set
 # CONFIG_FEATURE_USERNAME_COMPLETION is not set
@@ -274,9 +274,9 @@
 CONFIG_FEATURE_READLINK_FOLLOW=y
 CONFIG_RUN_PARTS=y
 CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
-CONFIG_START_STOP_DAEMON=y
-CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
-CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
+# CONFIG_START_STOP_DAEMON is not set
+# CONFIG_FEATURE_START_STOP_DAEMON_FANCY is not set
+# CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS is not set
 CONFIG_WHICH=y
 
 #
@@ -358,7 +358,7 @@
 CONFIG_FEATURE_SU_SYSLOG=y
 CONFIG_FEATURE_SU_CHECKS_SHELLS=y
 CONFIG_SULOGIN=y
-CONFIG_VLOCK=y
+# CONFIG_VLOCK is not set
 
 #
 # Linux Ext2 FS Progs
@@ -453,11 +453,11 @@
 #
 # CONFIG_ADJTIMEX is not set
 # CONFIG_BBCONFIG is not set
-CONFIG_CROND=y
+# CONFIG_CROND is not set
 # CONFIG_DEBUG_CROND_OPTION is not set
 # CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
-CONFIG_CRONTAB=y
-CONFIG_DC=y
+# CONFIG_CRONTAB is not set
+# CONFIG_DC is not set
 # CONFIG_DEVFSD is not set
 # CONFIG_DEVFSD_MODLOAD is not set
 # CONFIG_DEVFSD_FG_NP is not set
@@ -483,7 +483,7 @@
 # CONFIG_FEATURE_MAKEDEVS_LEAF is not set
 # CONFIG_FEATURE_MAKEDEVS_TABLE is not set
 CONFIG_MOUNTPOINT=y
-CONFIG_MT=y
+# CONFIG_MT is not set
 # CONFIG_NMETER is not set
 # CONFIG_RAIDAUTORUN is not set
 # CONFIG_READAHEAD is not set
@@ -597,7 +597,7 @@
 # Process Utilities
 #
 CONFIG_FREE=y
-CONFIG_FUSER=y
+# CONFIG_FUSER is not set
 CONFIG_KILL=y
 CONFIG_KILLALL=y
 CONFIG_KILLALL5=y
@@ -652,15 +652,15 @@
 #
 # System Logging Utilities
 #
-CONFIG_SYSLOGD=y
-CONFIG_FEATURE_ROTATE_LOGFILE=y
+# CONFIG_SYSLOGD is not set
+# CONFIG_FEATURE_ROTATE_LOGFILE is not set
 # CONFIG_FEATURE_REMOTE_LOG is not set
 # CONFIG_FEATURE_IPC_SYSLOG is not set
 CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=
 # CONFIG_LOGREAD is not set
 # CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
-CONFIG_KLOGD=y
-CONFIG_LOGGER=y
+# CONFIG_KLOGD is not set
+# CONFIG_LOGGER is not set
 
 #
 # Runit Utilities
