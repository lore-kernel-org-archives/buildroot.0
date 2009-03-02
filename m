From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Mar 2009 08:34:20 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: docs target/device
	target/device/ARMLTD/ etc...
Message-ID: <20090302083420.ECF857656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-02 08:34:20 +0000 (Mon, 02 Mar 2009)
New Revision: 25478

Log:
s/buildroot.uclibc.org/buildroot.net/

Modified:
   trunk/buildroot/docs/U-boot.html
   trunk/buildroot/docs/buildroot.html
   trunk/buildroot/docs/download.html
   trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig
   trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
   trunk/buildroot/target/device/Config.in.mirrors
   trunk/buildroot/target/device/x86/i686/i386_defconfig
   trunk/buildroot/target/device/x86/i686/i686_defconfig


Changeset:
Modified: trunk/buildroot/docs/U-boot.html
===================================================================
--- trunk/buildroot/docs/U-boot.html	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/docs/U-boot.html	2009-03-02 08:34:20 UTC (rev 25478)
@@ -16,7 +16,7 @@
 	<h1>U-boot extensions in 2009.01-rc1</h1>
 	</div>
 
-	<p><a href="http://buildroot.uclibc.org/">U-Boot</a>
+	<p><a href="http://buildroot.net/">U-Boot</a>
 	usage and documentation by Ulf Samuelsson.
 	</p>
 

Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/docs/buildroot.html	2009-03-02 08:34:20 UTC (rev 25478)
@@ -15,7 +15,7 @@
       <h1>Buildroot</h1>
     </div>
 
-    <p><a href="http://buildroot.uclibc.org/">Buildroot</a>
+    <p><a href="http://buildroot.net/">Buildroot</a>
     usage and documentation by Thomas Petazzoni. Contributions from
     Karsten Kruse, Ned Ludd, Martin Herren and others. </p>
 
@@ -120,15 +120,15 @@
     SVN. As of today, no stable releases of Buildroot are made. </p>
 
     <p>The latest snapshot is always available at <a
-    href="http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2">http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2</a>,
+    href="http://buildroot.net/downloads/snapshots/buildroot-snapshot.tar.bz2">http://buildroot.net/downloads/snapshots/buildroot-snapshot.tar.bz2</a>,
     and previous snapshots are also available at <a
-    href="http://buildroot.uclibc.org/downloads/snapshots/">http://buildroot.uclibc.org/downloads/snapshots/</a>. </p>
+    href="http://buildroot.net/downloads/snapshots/">http://buildroot.net/downloads/snapshots/</a>. </p>
 
     <p>To download Buildroot using SVN, you can simply follow
     the rules described on the &quot;Accessing SVN&quot;-page (<a href=
-    "http://buildroot.uclibc.org/subversion.html">http://buildroot.uclibc.org/subversion.html</a>)
+    "http://buildroot.net/subversion.html">http://buildroot.net/subversion.html</a>)
     of the uClibc buildroot website (<a href=
-    "http://buildroot.uclibc.org">http://buildroot.uclibc.org</a>), and download the
+    "http://buildroot.net">http://buildroot.net</a>), and download the
     <code>buildroot</code> SVN module. For the impatient, here's a quick
     recipe:</p>
 

Modified: trunk/buildroot/docs/download.html
===================================================================
--- trunk/buildroot/docs/download.html	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/docs/download.html	2009-03-02 08:34:20 UTC (rev 25478)
@@ -7,7 +7,7 @@
 <p>
 
 The latest release can always be dowloaded from
-<a href="/downloads/">http://buildroot.uclibc.org/downloads/</a>.
+<a href="/downloads/">http://buildroot.net/downloads/</a>.
 
 <p>
 

Modified: trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig
===================================================================
--- trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -94,7 +94,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="switch"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
===================================================================
--- trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -94,7 +94,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="switch"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -150,7 +150,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -145,7 +145,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -156,7 +156,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -145,7 +145,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -163,7 +163,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -145,7 +145,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -164,7 +164,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -166,7 +166,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -148,7 +148,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -167,7 +167,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -164,7 +164,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -147,7 +147,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -166,7 +166,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -164,7 +164,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -145,7 +145,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -164,7 +164,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -96,7 +96,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -96,7 +96,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -96,7 +96,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/Config.in.mirrors
===================================================================
--- trunk/buildroot/target/device/Config.in.mirrors	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/Config.in.mirrors	2009-03-02 08:34:20 UTC (rev 25478)
@@ -11,7 +11,7 @@
 
 config BR2_BACKUP_SITE
 	string "Backup download site"
-	default "http://buildroot.uclibc.org/downloads/sources/"
+	default "http://buildroot.net/downloads/sources/"
 	help
 	  Backup site to download from. If this option is set then buildroot
 	  will fall back to download package sources from here if the

Modified: trunk/buildroot/target/device/x86/i686/i386_defconfig
===================================================================
--- trunk/buildroot/target/device/x86/i686/i386_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/x86/i686/i386_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -93,7 +93,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"

Modified: trunk/buildroot/target/device/x86/i686/i686_defconfig
===================================================================
--- trunk/buildroot/target/device/x86/i686/i686_defconfig	2009-03-02 08:33:55 UTC (rev 25477)
+++ trunk/buildroot/target/device/x86/i686/i686_defconfig	2009-03-02 08:34:20 UTC (rev 25478)
@@ -93,7 +93,7 @@
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
