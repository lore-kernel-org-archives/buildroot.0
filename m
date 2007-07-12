From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 12 Jul 2007 10:04:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070712170409.87C9BA6594@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-12 10:04:05 -0700 (Thu, 12 Jul 2007)
New Revision: 19077

Log:
Fix Document style

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-07-12 16:57:47 UTC (rev 19076)
+++ trunk/buildroot/docs/buildroot.html	2007-07-12 17:04:05 UTC (rev 19077)
@@ -16,7 +16,7 @@
     </div>
 
     <p><a href="http://buildroot.uclibc.org/">Buildroot</a> usage and documentation by Thomas Petazzoni. Contributions from
-    Karsten Kruse, Ned Ludd, Martin Herren and others.</p>
+    Karsten Kruse, Ned Ludd, Martin Herren and others. </p>
 
     <p><small>$LastChangedDate$</small></p>
 
@@ -47,12 +47,12 @@
     generate both a cross-compilation toolchain and a root filesystem for your
     target. The cross-compilation toolchain uses uClibc (<a href=
     "http://www.uclibc.org/">http://www.uclibc.org/</a>), a tiny C standard
-    library.</p>
+    library. </p>
 
     <p>Buildroot is useful mainly for people working with embedded systems.
     Embedded systems often use processors that are not the regular x86
     processors everyone is used to have on his PC. It can be PowerPC
-    processors, MIPS processors, ARM processors, etc.</p>
+    processors, MIPS processors, ARM processors, etc. </p>
 
     <p>A compilation toolchain is the set of tools that allows to
     compile code for your system. It consists of a compiler (in our
@@ -71,7 +71,7 @@
     generally, the machine on which it is running, and on which you're
     working is called the &quot;host system&quot;. The compilation toolchain 
     is provided by your distribution, and Buildroot has nothing to do
-    with it.</p>
+    with it. </p>
 
     <p>As said above, the compilation toolchain that comes with your system
     runs and generates code for the processor of your host system. As your
@@ -81,7 +81,7 @@
     example, if your host system uses x86 and your target system uses ARM, the
     regular compilation toolchain of your host runs on x86 and generates code
     for x86, while the cross-compilation toolchain runs on x86 and generates
-    code for ARM.</p>
+    code for ARM. </p>
 
     <p>Even if your embedded system uses a x86 processor, you might interested
     in Buildroot, for two reasons:</p>
@@ -92,10 +92,10 @@
       Libc on your target system, you can use uClibc which is a tiny C standard
       library. If you want to use this C library, then you need a compilation
       toolchain to generate binaries linked with it. Buildroot can do it for
-      you.</li>
+      you. </li>
 
       <li>Buildroot automates the building of a root filesystem with all needed
-      tools like busybox. It makes it much easier than doing it by hand.</li>
+      tools like busybox. It makes it much easier than doing it by hand. </li>
     </ul>
 
     <p>You might wonder why such a tool is needed when you can compile
@@ -105,17 +105,17 @@
     version it very time-consuming and uninteresting. Buildroot automates this
     process through the use of Makefiles, and has a collection of patches for
     each <code>gcc</code> and <code>binutils</code> version to make them work
-    on most architectures.</p>
+    on most architectures. </p>
 
     <h2><a name="download" id="download"></a>Obtaining Buildroot</h2>
 
     <p>Buildroot is available as daily SVN snapshots or directly using
-    SVN.</p>
+    SVN. </p>
 
     <p>The latest snapshot is always available at <a
     href="http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2">http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2</a>,
     and previous snapshots are also available at <a
-    href="http://buildroot.uclibc.org/downloads/snapshots/">http://buildroot.uclibc.org/downloads/snapshots/</a>.</p>
+    href="http://buildroot.uclibc.org/downloads/snapshots/">http://buildroot.uclibc.org/downloads/snapshots/</a>. </p>
 
     <p>To download Buildroot using SVN, you can simply follow
     the rules described on the &quot;Accessing SVN&quot;-page (<a href=
@@ -144,7 +144,7 @@
 </pre>
 
     <p>For each entry of the configuration tool, you can find associated help
-    that describes the purpose of the entry.</p>
+    that describes the purpose of the entry. </p>
 
     <p>One of the key configuration items is the <code>PROJECT</code> which
     determines where some board specific packages are built and where the
@@ -152,7 +152,7 @@
 
     <p>Once everything is configured, the configuration tool has generated a
     <code>.config</code> file that contains the description of your
-    configuration. It will be used by the Makefiles to do what's needed.</p>
+    configuration. It will be used by the Makefiles to do what's needed. </p>
 
 
     <p>Let's go:</p>
@@ -176,7 +176,7 @@
  $ make source
 </pre>
     <p>You can now disconnect or copy the content of your <code>dl</code> 
-    directory to the build-host.</p>
+    directory to the build-host. </p>
 
     <h3><a name="environment_variables" id="environment_variables"></a>
     Environment variables</h3>
@@ -214,7 +214,7 @@
       You can simply make your changes here, and run make afterwards, which will
       rebuild the target filesystem image. This method allows to do everything 
       on the target filesystem, but if you decide to completely rebuild your 
-      toolchain and tools, these changes will be lost.</li>
+      toolchain and tools, these changes will be lost. </li>
 
       <li>Customize the target filesystem skeleton, available under
       <code>target/generic/target_skeleton/</code>. You can customize
@@ -222,7 +222,7 @@
       is not yet present, because it's created during the compilation process.
       So you can't do everything on this target filesystem skeleton, but
       changes to it remain even if you completely rebuild the cross-compilation
-      toolchain and the tools.<br />
+      toolchain and the tools. <br />
       You can also customize the <code>target/generic/device_table.txt</code>
       file which is used by the tools that generate the target filesystem image
       to properly set permissions and create device nodes. The
@@ -230,11 +230,11 @@
       directories of a root filesystem and there is no obvious reason for which
       it should be changed. These main directories are in an tarball inside of
       inside the skeleton because it contains symlinks that would be broken
-      otherwise.<br />
+      otherwise. <br />
       These customizations are deployed into 
       <code>project_build_ARCH/root/</code> just before the actual image
       is made. So simply rebuilding the image by running
-      make should propagate any new changes to the image.</li>
+      make should propagate any new changes to the image. </li>
 
       <li>When configuring the build system, using <code>make menuconfig</code>,
       you can specify the contents of the /etc/hostname and /etc/issue
@@ -247,17 +247,17 @@
     <p><a href="http://www.busybox.net/">Busybox</a> is very configurable, and
     you may want to customize it. You can
     follow these simple steps to do it. It's not an optimal way, but it's
-    simple and it works.</p>
+    simple and it works. </p>
 
     <ol>
       <li>Make a first compilation of buildroot with busybox without trying to
-      customize it.</li>
+      customize it. </li>
 
       <li>Invoke <code>make busybox-menuconfig</code>.
       The nice configuration tool appears and you can
-      customize everything.</li>
+      customize everything. </li>
 
-      <li>Run the compilation of buildroot again.</li>
+      <li>Run the compilation of buildroot again. </li>
     </ol>
 
     <p>Otherwise, you can simply change the
@@ -265,7 +265,7 @@
     know the options you want to change without using the configuration tool.
     </p>
     <p>If you want to use an existing config file for busybox, then see 
-    section <a href="#environment_variables">environment variables</a>.</p>
+    section <a href="#environment_variables">environment variables</a>. </p>
 
     <h2><a name="custom_uclibc" id="custom_uclibc"></a>Customizing the uClibc
     configuration</h2>
@@ -273,7 +273,7 @@
     <p>Just like <a href="#custom_busybox">BusyBox</a>, <a
     href="http://www.uclibc.org/">uClibc</a> offers a lot of
     configuration options. They allow to select various
-    functionalities, depending on your needs and limitations.</p>
+    functionalities, depending on your needs and limitations. </p>
 
     <p>The easiest way to modify the configuration of uClibc is to
     follow these steps :</p>
@@ -281,19 +281,19 @@
     <ol>
 
       <li>Make a first compilation of buildroot without trying to
-      customize uClibc.</li>
+      customize uClibc. </li>
 
       <li>Invoke <code>make uclibc-menuconfig</code>.
       The nice configuration assistant, similar to
       the one used in the Linux Kernel or in Buildroot appears. Make
-      your configuration as appropriate.</li>
+      your configuration as appropriate. </li>
 
       <li>Copy the <code>.config</code> file to
       <code>toolchain/uClibc/uClibc.config</code> or
       <code>toolchain/uClibc/uClibc.config-locale</code>. The former
       is used if you haven't selected locale support in Buildroot
       configuration, and the latter is used if you have selected
-      locale support.</li>
+      locale support. </li>
 
       <li>Run the compilation of Buildroot again</li>
 
@@ -302,10 +302,10 @@
     <p>Otherwise, you can simply change
     <code>toolchain/uClibc/uClibc.config</code> or
     <code>toolchain/uClibc/uClibc.config-locale</code> without running
-    the configuration assistant.</p>
+    the configuration assistant. </p>
 
     <p>If you want to use an existing config file for uclibc, then see 
-    section <a href="#environment_variables">environment variables</a>.</p>
+    section <a href="#environment_variables">environment variables</a>. </p>
 
     <h2><a name="buildroot_innards" id="buildroot_innards"></a>How Buildroot
     works</h2>
@@ -314,7 +314,7 @@
     configure and compiles software with the correct options. It also includes
     some patches for various software, mainly the ones involved in the
     cross-compilation tool chain (<code>gcc</code>, <code>binutils</code> and
-    uClibc).</p>
+    uClibc). </p>
 
     <p>There is basically one Makefile per software, and they are named with
     the <code>.mk</code> extension. Makefiles are split into three
@@ -324,13 +324,13 @@
       <li><b>package</b> (in the <code>package/</code> directory) contains the
       Makefiles and associated files for all user-space tools that Buildroot
       can compile and add to the target root filesystem. There is one
-      sub-directory per tool.</li>
+      sub-directory per tool. </li>
 
       <li><b>toolchain</b> (in the <code>toolchain/</code> directory) contains
       the Makefiles and associated files for all software related to the
       cross-compilation toolchain : <code>binutils</code>, <code>ccache</code>,
       <code>gcc</code>, <code>gdb</code>, <code>kernel-headers</code> and
-      <code>uClibc</code>.</li>
+      <code>uClibc</code>. </li>
 
       <li><b>target</b> (in the <code>target</code> directory) contains the
       Makefiles and associated files for software related to the generation of
@@ -338,18 +338,18 @@
       : ext2, jffs2, cramfs and squashfs. For each of them, there's a
       sub-directory with the required files. There is also a
       <code>default/</code> directory that contains the target filesystem
-      skeleton.</li>
+      skeleton. </li>
     </ul>
 
     <p>Each directory contains at least 2 files :</p>
 
     <ul>
       <li><code>something.mk</code> is the Makefile that downloads, configures,
-      compiles and installs the software <code>something</code>.</li>
+      compiles and installs the software <code>something</code>. </li>
 
       <li><code>Config.in</code> is a part of the configuration tool
       description file. It describes the option related to the current
-      software.</li>
+      software. </li>
 
     </ul>
 
@@ -360,7 +360,7 @@
       <li>Create the download directory (<code>dl/</code> by default). This is
       where the tarballs will be downloaded. It is interesting to know that the
       tarballs are in this directory because it may be useful to save them
-      somewhere to avoid further downloads.</li>
+      somewhere to avoid further downloads. </li>
 
       <li>Create the shared build directory (<code>build_ARCH/</code> by
       default, where <code>ARCH</code> is your architecture). This is where all
@@ -381,7 +381,7 @@
 
       <li>Create the project specific result directory 
       (<code>binaries/$(PROJECT)</code> by default, where <code>ARCH</code> 
-      is your architecture). This is where the root file system images are
+      is your architecture). This is where the root filesystem images are
       stored, It is also used to store the linux kernel image and any 
       utilities, boot-loaders etc. needed for a target.
       </li>
@@ -389,7 +389,7 @@
       <li>Create the toolchain build directory
       (<code>toolchain_build_ARCH/</code> by default, where <code>ARCH</code>
       is your architecture). This is where the cross compilation toolchain will
-      be compiled.</li>
+      be compiled. </li>
 
       <li>Setup the staging directory (<code>build_ARCH/staging_dir/</code> by
       default). This is where the cross-compilation toolchain will be
@@ -398,7 +398,7 @@
       <code>build_ARCH/staging_dir/usr/bin</code> to your PATH, and then use
       <code>arch-linux-gcc</code> to compile your application. In order to
       setup this staging directory, it first removes it, and then it creates
-      various subdirectories and symlinks inside it.</li>
+      various subdirectories and symlinks inside it. </li>
 
       <li>Create the target directory (<code>project_build_ARCH/root/</code> by
       default) and the target filesystem skeleton. This directory will contain
@@ -406,12 +406,12 @@
       uncompress the <code>target/generic/skel.tar.gz</code> file to create the
       main subdirectories and symlinks, copies the skeleton available in
       <code>target/generic/target_skeleton</code> and then removes useless
-      <code>.svn/</code> directories.</li>
+      <code>.svn/</code> directories. </li>
 
       <li>Add the <code>TARGETS</code> dependency. This should generally check
       if the configuration option for this package is enabled, and if so then
       &quot;subscribe&quot; this package to be compiled by adding it to the
-      TARGETS global variable.</li>
+      TARGETS global variable. </li>
     </ol>
 
     <h2><a name="using_toolchain" id="using_toolchain"></a>Using the
@@ -419,14 +419,14 @@
 
     <p>You may want to compile your own programs or other software
     that are not packaged in Buildroot. In order to do this, you can
-    use the toolchain that was generated by Buildroot.</p>
+    use the toolchain that was generated by Buildroot. </p>
 
     <p>The toolchain generated by Buildroot by default is located in
     <code>build_ARCH/staging_dir/</code>. The simplest way to use it
     is to add <code>build_ARCH/staging_dir/usr/bin/</code> to your PATH
     environnement variable, and then to use
     <code>arch-linux-gcc</code>, <code>arch-linux-objdump</code>,
-    <code>arch-linux-ld</code>, etc.</p>
+    <code>arch-linux-ld</code>, etc. </p>
 
     <p>For example, you may add the following to your
     <code>.bashrc</code> (considering you're building for the MIPS
@@ -448,10 +448,10 @@
     <i>gcc</i> configuration. If the default toolchain directory
     doesn't suit your needs, please refer to the <a
     href="#toolchain_standalone">Using the uClibc toolchain outside of
-    buildroot</a> section.</p>
+    buildroot</a> section. </p>
     <p>If you are using a current gcc-4.x, then use --sysroot and -isysroot
     since these toolchains have fully functional sysroot support. No
-    hardcoded paths do exist in these configurations.</p>
+    hardcoded paths do exist in these configurations. </p>
 
     <h2><a name="toolchain_standalone" id="toolchain_standalone"></a>Using the
     uClibc toolchain outside of buildroot</h2>
@@ -462,13 +462,13 @@
     or by other users. Moving the <code>build_ARCH/staging_dir/</code>
     directory elsewhere is <b>not possible if using gcc-3.x</b>, because they 
     are some hardcoded paths in the toolchain configuration. This works, thanks 
-    to sysroot support, with current, stable gcc-4.x toolchains, of course.</p>
+    to sysroot support, with current, stable gcc-4.x toolchains, of course. </p>
 
     <p>If you want to use the generated gcc-3.x toolchain for other purposes,
     you can configure Buildroot to generate it elsewhere using the
     option of the configuration tool : <code>Build options -&gt;
     Toolchain and header file location</code>, which defaults to
-    <code>$(BUILD_DIR)/staging_dir/</code>.</p>
+    <code>$(BUILD_DIR)/staging_dir/</code>. </p>
 
     <h2><a name="downloaded_packages"
     id="downloaded_packages"></a>Location of downloaded packages</h2>
@@ -480,18 +480,18 @@
     version of Buildroot which is know to be working with the
     associated tarballs. This will allow you to regenerate the
     toolchain and the target filesystem with exactly the same
-    versions.</p>
+    versions. </p>
 
     <h2><a name="add_software" id="add_software"></a>Extending Buildroot with
     more software</h2>
 
     <p>This section will only consider the case in which you want to
-    add user-space software.</p>
+    add user-space software. </p>
 
     <h3>Package directory</h3>
 
     <p>First of all, create a directory under the <code>package</code>
-    directory for your software, for example <code>foo</code>.</p>
+    directory for your software, for example <code>foo</code>. </p>
 
     <h3><code>Config.in</code> file</h3>
 
@@ -511,7 +511,7 @@
 </pre>
 
     <p>Of course, you can add other options to configure particular
-    things in your software.</p>
+    things in your software. </p>
 
    <h3>The real <i>Makefile</i></h3>
 
@@ -519,7 +519,7 @@
    <code>foo.mk</code>. It will contain the <i>Makefile</i> rules that
    are in charge of downloading, configuring, compiling and installing
    the software. Below is an example that we will comment
-   afterwards.</p>
+   afterwards. </p>
 
 <pre>
      <a name="line1" id="line1">1</a>  #############################################################
@@ -587,7 +587,7 @@
     binary software. For other software such as libraries or more
     complex stuff with multiple binaries, it should be adapted. Look at
     the other <code>*.mk</code> files in the <code>package</code>
-    directory.</p>
+    directory. </p>
 
     <p>At lines <a href="#line6">6-11</a>, a couple of useful variables are 
     defined :</p>
@@ -595,33 +595,33 @@
     <ul>
 
      <li><code>FOO_VERSION</code> : The version of <i>foo</i> that
-     should be downloaded.</li>
+     should be downloaded. </li>
 
      <li><code>FOO_SOURCE</code> : The name of the tarball of
      <i>foo</i> on the download website of FTP site. As you can see
-     <code>FOO_VERSION</code> is used.</li>
+     <code>FOO_VERSION</code> is used. </li>
 
      <li><code>FOO_SITE</code> : The HTTP or FTP site from which
      <i>foo</i> archive is downloaded. It must include the complete
      path to the directory where <code>FOO_SOURCE</code> can be
-     found.</li>
+     found. </li>
 
      <li><code>FOO_DIR</code> : The directory into which the software
      will be configured and compiled. Basically, it's a subdirectory
      of <code>BUILD_DIR</code> which is created upon decompression of
-     the tarball.</li>
+     the tarball. </li>
 
      <li><code>FOO_BINARY</code> : Software binary name. As said
-     previously, this is an example for a single binary software.</li>
+     previously, this is an example for a single binary software. </li>
 
      <li><code>FOO_TARGET_BINARY</code> : The full path of the binary
-     inside the target filesystem.</li>
+     inside the target filesystem. </li>
 
     </ul>
 
     <p>Lines <a href="#line13">13-14</a> defines a target that downloads the 
     tarball from the remote site to the download directory
-    (<code>DL_DIR</code>).</p>
+    (<code>DL_DIR</code>). </p>
 
     <p>Lines <a href="#line16">16-18</a> defines a target and associated rules 
     that uncompress the downloaded tarball. As you can see, this target
@@ -631,7 +631,7 @@
     to mark the software has having been uncompressed. This trick is
     used everywhere in Buildroot <i>Makefile</i> to split steps
     (download, uncompress, configure, compile, install) while still
-    having correct dependencies.</p>
+    having correct dependencies. </p>
 
     <p>Lines <a href="#line20">20-31</a> defines a target and associated rules 
     that configures the software. It depends on the previous target (the
@@ -643,14 +643,14 @@
     <code>/usr</code>, not because the software will be installed in
     <code>/usr</code> on your host system, but in the target
     filesystem. Finally it creates a <code>.configured</code> file to
-    mark the software as configured.</p>
+    mark the software as configured. </p>
 
     <p>Lines <a href="#line33">33-34</a> defines a target and a rule that 
     compiles the software. This target will create the binary file in the
     compilation directory, and depends on the software being already
     configured (hence the reference to the <code>.configured</code>
     file). It basically runs <code>make</code> inside the source
-    directory.</p>
+    directory. </p>
 
     <p>Lines <a href="#line36">36-38</a> defines a target and associated rules 
     that install the software inside the target filesystem. It depends on the
@@ -661,7 +661,7 @@
     the software inside host <code>/usr</code> but inside target
     <code>/usr</code>. After the installation, the
     <code>/usr/man</code> directory inside the target filesystem is
-    removed to save space.</p>
+    removed to save space. </p>
 
     <p>Line <a href="#line40">40</a> defines the main target of the software, 
     the one that will be eventually be used by the top level
@@ -678,18 +678,18 @@
     once for later offline build. Note that if you add a new package providing
     a <code>foo-source</code> target is <i>mandatory</i> to support
     users that wish to do offline-builds. Furthermore it eases checking
-    if all package-sources are downloadable.</p>
+    if all package-sources are downloadable. </p>
 
     <p>Lines <a href="#line44">44-46</a> define a simple target to clean the 
     software build by calling the <i>Makefiles</i> with the appropriate option.
     The <code>-clean</code> target should run <code>make clean</code>
     on $(BUILD_DIR)/package-version and MUST uninstall all files of the
-    package from $(STAGING_DIR) and from $(TARGET_DIR).</p>
+    package from $(STAGING_DIR) and from $(TARGET_DIR). </p>
 
     <p>Lines <a href="#line48">48-49</a> define a simple target to completely 
     remove the directory in which the software was uncompressed, configured and
     compiled. The <code>-dirclean</code> target MUST completely rm $(BUILD_DIR)/
-    package-version.</p>
+    package-version. </p>
 
     <p>Lines <a href="#line51">51-58</a> adds the target <code>foo</code> to 
     the list of targets to be compiled by Buildroot by first checking if
@@ -699,7 +699,7 @@
     global variable.  The name added to the TARGETS global
     variable is the name of this package's target, as defined on
     line <a href="#line40">40</a>, which is used by Buildroot to download, 
-    compile, and then install this package.</p>
+    compile, and then install this package. </p>
 
 
     <h3>Conclusion</h3>
@@ -707,7 +707,7 @@
     <p>As you can see, adding a software to buildroot is simply a
     matter of writing a <i>Makefile</i> using an already existing
     example and to modify it according to the compilation process of
-    the software.</p>
+    the software. </p>
 
     <p>If you package software that might be useful for other persons,
     don't forget to send a patch to Buildroot developers !</p>
