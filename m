From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:29:21 +0200
Subject: [Buildroot] [git commit branch/next] package/d*/Config.in: fix help
	text wrapping
Message-ID: <20170511213337.CE5538291D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67f4794de1d87f25a2fad13c854a330f286d08ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter d in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus-triggerd/Config.in      |  4 ++--
 package/ddrescue/Config.in           |  6 +++---
 package/dialog/Config.in             |  7 ++++---
 package/directfb-examples/Config.in  |  6 +++---
 package/directfb/Config.in           | 12 +++++++-----
 package/dmalloc/Config.in            |  8 ++++----
 package/dmraid/Config.in             |  5 +++--
 package/dnsmasq/Config.in            |  3 ++-
 package/doom-wad/Config.in           |  6 ++++--
 package/dovecot-pigeonhole/Config.in |  6 +++---
 package/dovecot/Config.in            | 10 +++++-----
 package/dstat/Config.in              | 25 +++++++++++++------------
 package/dtach/Config.in              |  7 ++++---
 package/dtc/Config.in                | 12 +++++++-----
 package/dtc/Config.in.host           |  3 ++-
 package/dvbsnoop/Config.in           | 28 ++++++++++++++--------------
 package/dvdauthor/Config.in          | 11 ++++++-----
 17 files changed, 86 insertions(+), 73 deletions(-)

diff --git a/package/dbus-triggerd/Config.in b/package/dbus-triggerd/Config.in
index a39f911..331c414 100644
--- a/package/dbus-triggerd/Config.in
+++ b/package/dbus-triggerd/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_DBUS_TRIGGERD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_PACKAGE_DBUS
 	help
-	  dbus-triggerd is a tool to trigger shell-commands upon receiving
-	  a given dbus-signal.
+	  dbus-triggerd is a tool to trigger shell-commands upon
+	  receiving a given dbus-signal.
 
 	  http://gareus.org/oss/dbustriggerd/start
 
diff --git a/package/ddrescue/Config.in b/package/ddrescue/Config.in
index 2ec3e7e..a58561c 100644
--- a/package/ddrescue/Config.in
+++ b/package/ddrescue/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_DDRESCUE
 	bool "ddrescue"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  GNU ddrescue is a data recovery tool. It copies data from one file
-	  or block device (hard disc, cdrom, etc) to another, trying to
-	  rescue the good parts first in case of read errors.
+	  GNU ddrescue is a data recovery tool. It copies data from one
+	  file or block device (hard disc, cdrom, etc) to another,
+	  trying to rescue the good parts first in case of read errors.
 
 	  http://www.gnu.org/software/ddrescue/ddrescue.html
 
diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index 73b7176..830427e 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -6,8 +6,9 @@ config BR2_PACKAGE_DIALOG
 	help
 	  dialog - display dialog boxes from shell scripts
 
-	  This application provides a method of displaying several different
-	  types of dialog boxes from shell scripts. This allows a developer
-	  of a script to interact with the user in a much friendlier manner.
+	  This application provides a method of displaying several
+	  different types of dialog boxes from shell scripts. This
+	  allows a developer of a script to interact with the user in a
+	  much friendlier manner.
 
 	  http://invisible-island.net/dialog/dialog.html
diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
index eef9f5c..216e036 100644
--- a/package/directfb-examples/Config.in
+++ b/package/directfb-examples/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES
 	bool "directfb examples"
 	depends on BR2_PACKAGE_DIRECTFB
 	help
-	  The DirectFB-examples package contains a set of simple DirectFB
-	  applications that can be used to test and demonstrate various
-	  DirectFB features.
+	  The DirectFB-examples package contains a set of simple
+	  DirectFB applications that can be used to test and demonstrate
+	  various DirectFB features.
 
 	  http://directfb.org/downloads/Extras/README.DirectFB-examples
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index e3b53e0..554abe2 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -9,11 +9,13 @@ config BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
 	help
-	  DirectFB (Direct Frame Buffer) is a set of graphics APIs implemented
-	  on top of the Linux Frame Buffer (fbdev) abstraction layer. It is an
-	  alternative to X11 with a smaller memory footprint that still has an
-	  integrated windowing system. As of 4 October 2015, DirectFB's website
-	  http://www.directfb.org/ is down. See alternative site listed below.
+	  DirectFB (Direct Frame Buffer) is a set of graphics APIs
+	  implemented on top of the Linux Frame Buffer (fbdev)
+	  abstraction layer. It is an alternative to X11 with a smaller
+	  memory footprint that still has an integrated windowing
+	  system. As of 4 October 2015, DirectFB's website
+	  http://www.directfb.org/ is down. See alternative site listed
+	  below.
 
 	  http://elinux.org/DirectFB
 
diff --git a/package/dmalloc/Config.in b/package/dmalloc/Config.in
index 03d9f97..e5be109 100644
--- a/package/dmalloc/Config.in
+++ b/package/dmalloc/Config.in
@@ -5,9 +5,9 @@ config BR2_PACKAGE_DMALLOC
 	# different segments".
 	depends on !(BR2_microblaze && BR2_ENABLE_DEBUG)
 	help
-	  A debug memory allocation library which is a drop in replacement for
-	  the system's malloc, realloc, calloc, free and other memory management
-	  routines while providing powerful debugging facilities configurable at
-	  runtime.
+	  A debug memory allocation library which is a drop in
+	  replacement for the system's malloc, realloc, calloc, free and
+	  other memory management routines while providing powerful
+	  debugging facilities configurable at runtime.
 
 	  http://dmalloc.com/
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 583f3f2..d0acc4f 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -6,8 +6,9 @@ config BR2_PACKAGE_DMRAID
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	select BR2_PACKAGE_LVM2
 	help
-	  dmraid discovers, activates, deactivates and displays properties
-	  of software RAID sets (eg, ATARAID) and contained DOS partitions.
+	  dmraid discovers, activates, deactivates and displays
+	  properties of software RAID sets (eg, ATARAID) and contained
+	  DOS partitions.
 
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index b4f34b8..936b1de 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -34,7 +34,8 @@ config BR2_PACKAGE_DNSMASQ_IDN
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Enable IDN support in dnsmasq.
-	  This option is a big space taker since it pulls in many libraries.
+	  This option is a big space taker since it pulls in many
+	  libraries.
 
 config BR2_PACKAGE_DNSMASQ_LUA
 	bool "Lua scripting support"
diff --git a/package/doom-wad/Config.in b/package/doom-wad/Config.in
index edd299b..6f51cfb 100644
--- a/package/doom-wad/Config.in
+++ b/package/doom-wad/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_DOOM_WAD
 	bool "shareware Doom WAD file"
 	depends on BR2_PACKAGE_CHOCOLATE_DOOM || BR2_PACKAGE_PRBOOM
 	help
-	  This will install the shareware wad data file for the doom game.
+	  This will install the shareware wad data file for the doom
+	  game.
 
-	  The wad file will be placed in the /usr/share/games/doom directory.
+	  The wad file will be placed in the /usr/share/games/doom
+	  directory.
diff --git a/package/dovecot-pigeonhole/Config.in b/package/dovecot-pigeonhole/Config.in
index 83f5287..bd6826b 100644
--- a/package/dovecot-pigeonhole/Config.in
+++ b/package/dovecot-pigeonhole/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_DOVECOT_PIGEONHOLE
 	bool "dovecot-pigeonhole"
 	help
-	  Pigeonhole is the name of the project that adds support for the Sieve
-	  language (RFC 5228) and the ManageSieve protocol (RFC 5804) to the
-	  Dovecot Secure IMAP Server.
+	  Pigeonhole is the name of the project that adds support for
+	  the Sieve language (RFC 5228) and the ManageSieve protocol
+	  (RFC 5804) to the Dovecot Secure IMAP Server.
 
 	  http://pigeonhole.dovecot.org
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index b93e09f..377fd4d 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -5,11 +5,11 @@ config BR2_PACKAGE_DOVECOT
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
-	  Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-
-	  like systems, written with security primarily in mind. Dovecot is an
-	  excellent choice for both small and large installations. It's fast,
-	  simple to set up, requires no special administration and it uses very
-	  little memory.
+	  Dovecot is an open source IMAP and POP3 email server for
+	  Linux/UNIX- like systems, written with security primarily in
+	  mind. Dovecot is an excellent choice for both small and large
+	  installations. It's fast, simple to set up, requires no
+	  special administration and it uses very little memory.
 
 	  http://www.dovecot.org
 
diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 6536a5e..110aee8 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -6,19 +6,20 @@ config BR2_PACKAGE_DSTAT
 	depends on !BR2_STATIC_LIBS # python
 	select BR2_PACKAGE_PYTHON
 	help
-	  Dstat, written in Python, is a versatile replacement for vmstat,
-	  iostat, netstat and ifstat. Dstat overcomes some of their limitations
-	  and adds some extra features, more counters and flexibility. Dstat is
-	  handy for monitoring systems during performance tuning tests,
-	  benchmarks or troubleshooting.
-	  Dstat allows you to view all of your system resources in real-time,
-	  you can e.g. compare disk utilization in combination with interrupts
-	  from your IDE controller, or compare the network bandwidth numbers
-	  directly with the disk throughput (in the same interval).
+	  Dstat, written in Python, is a versatile replacement for
+	  vmstat, iostat, netstat and ifstat. Dstat overcomes some of
+	  their limitations and adds some extra features, more counters
+	  and flexibility. Dstat is handy for monitoring systems during
+	  performance tuning tests, benchmarks or troubleshooting.
+	  Dstat allows you to view all of your system resources in
+	  real-time, you can e.g. compare disk utilization in
+	  combination with interrupts from your IDE controller, or
+	  compare the network bandwidth numbers directly with the disk
+	  throughput (in the same interval).
 
-	  Note that to get proper output, your terminal size should be known by
-	  the termios subsystem. This can be done by running the 'resize'
-	  utility of busybox.
+	  Note that to get proper output, your terminal size should be
+	  known by the termios subsystem. This can be done by running
+	  the 'resize' utility of busybox.
 
 	  http://dag.wieers.com/home-made/dstat/
 
diff --git a/package/dtach/Config.in b/package/dtach/Config.in
index bea112b..3e6e493 100644
--- a/package/dtach/Config.in
+++ b/package/dtach/Config.in
@@ -2,8 +2,9 @@ config BR2_PACKAGE_DTACH
 	bool "dtach"
 	depends on BR2_USE_MMU # fork()
 	help
-	  dtach is a tiny program that emulates the detach feature of screen,
-	  allowing you to run a program in an environment that is protected
-	  from the controlling terminal and attach to it later.
+	  dtach is a tiny program that emulates the detach feature of
+	  screen, allowing you to run a program in an environment that
+	  is protected from the controlling terminal and attach to it
+	  later.
 
 	  http://dtach.sourceforge.net/
diff --git a/package/dtc/Config.in b/package/dtc/Config.in
index 39223f7..73bd368 100644
--- a/package/dtc/Config.in
+++ b/package/dtc/Config.in
@@ -6,7 +6,8 @@ config BR2_PACKAGE_DTC
 	  a given format and outputs a device-tree in another format.
 
 	  Note that only the library is installed.
-	  If you want the programs, say 'y' here, and to "dtc programs", below.
+	  If you want the programs, say 'y' here, and to "dtc programs",
+	  below.
 
 	  https://git.kernel.org/cgit/utils/dtc/dtc.git
 
@@ -19,13 +20,14 @@ config BR2_PACKAGE_DTC_PROGRAMS
 	    - convert-dtsv0     convert from version 0 to version 1
 	    - dtc               the device tree compiler
 	    - dtdiff            compare two device trees (needs bash)
-	    - fdtdump           print a readable version of a flat device tree
+	    - fdtdump           print a readable version of a
+	                        flat device tree
 	    - fdtget            read values from device tree
 	    - fdtput            write a property value to a device tree
 
-	  Note: dtdiff requires bash, so if bash is not selected, dtdiff will
-	        be removed from the target file system. Enable bash if you
-	        need dtdiff on the target.
+	  Note: dtdiff requires bash, so if bash is not selected, dtdiff
+	  will be removed from the target file system. Enable bash if
+	  you need dtdiff on the target.
 
 comment "dtdiff will not be installed: it requires bash"
 	depends on BR2_PACKAGE_DTC_PROGRAMS
diff --git a/package/dtc/Config.in.host b/package/dtc/Config.in.host
index cbabf0a..f80a49b 100644
--- a/package/dtc/Config.in.host
+++ b/package/dtc/Config.in.host
@@ -4,6 +4,7 @@ config BR2_PACKAGE_HOST_DTC
 	  The Device Tree Compiler, dtc, takes as input a device-tree in
 	  a given format and outputs a device-tree in another format.
 
-	  Install host tools: dtc, convert-dtsv0, fdtdump, fdtget and fdtput.
+	  Install host tools: dtc, convert-dtsv0, fdtdump, fdtget and
+	  fdtput.
 
 	  https://git.kernel.org/cgit/utils/dtc/dtc.git
diff --git a/package/dvbsnoop/Config.in b/package/dvbsnoop/Config.in
index fc34c34..fb63fa4 100644
--- a/package/dvbsnoop/Config.in
+++ b/package/dvbsnoop/Config.in
@@ -1,21 +1,21 @@
 config BR2_PACKAGE_DVBSNOOP
 	bool "dvbsnoop"
 	help
-	  Dvbsnoop is just a simple tool to analyze, view or debug a transport
-	  stream (TS), program elementary stream (PES) or even a program stream
-	  (PS). Dvbsnoop is trying to get input mostly direct from a frontend
-	  (satellite or cable tuner inside a set-top box for example) via DVB
-	  APIv3 to view into a TS, or a demux to view PES or PS (also mostly
-	  inside the set-top box or even PCI Card or USB Plug) but also from a
-	  file (recorded TS).
-	  Dvbsnoop is working well on SD transport streams but may have some
-	  limited functionality on HD transport streams (DVB-{C,S,T}2 because
-	  of missing knowledge how to handle it.
+	  Dvbsnoop is just a simple tool to analyze, view or debug a
+	  transport stream (TS), program elementary stream (PES) or even
+	  a program stream (PS). Dvbsnoop is trying to get input mostly
+	  direct from a frontend (satellite or cable tuner inside a
+	  set-top box for example) via DVB APIv3 to view into a TS, or a
+	  demux to view PES or PS (also mostly inside the set-top box or
+	  even PCI Card or USB Plug) but also from a file (recorded TS).
+	  Dvbsnoop is working well on SD transport streams but may have
+	  some limited functionality on HD transport streams
+	  (DVB-{C,S,T}2 because of missing knowledge how to handle it.
 
-	  Dvbsnoop itself doesn't do the tuning on the frontend, this has to be
-	  done by external helpers or manually driver call.
-	  The dvbsnoop tool was written while developing the software Neutrino
-	  on the set-top box DBox2.
+	  Dvbsnoop itself doesn't do the tuning on the frontend, this
+	  has to be done by external helpers or manually driver call.
+	  The dvbsnoop tool was written while developing the software
+	  Neutrino on the set-top box DBox2.
 
 	  http://dvbsnoop.sourceforge.net
 	  http://en.wikipedia.org/wiki/DBox2
diff --git a/package/dvdauthor/Config.in b/package/dvdauthor/Config.in
index 8b2bcb3..9ba5411 100644
--- a/package/dvdauthor/Config.in
+++ b/package/dvdauthor/Config.in
@@ -4,11 +4,12 @@ config BR2_PACKAGE_DVDAUTHOR
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBPNG
 	help
-	  DVDAuthor is a set of tools to help you author the file and directory
-	  structure of a DVD-Video disc, including programmatic commands for
-	  implementing interactive behaviour. It is driven by command lines and
-	  XML control files, though there are other programs that provide
-	  GUI-based front ends if you prefer
+	  DVDAuthor is a set of tools to help you author the file and
+	  directory structure of a DVD-Video disc, including
+	  programmatic commands for implementing interactive behaviour.
+	  It is driven by command lines and XML control files, though
+	  there are other programs that provide GUI-based front ends
+	  if you prefer
 
 	  http://dvdauthor.sourceforge.net
 
