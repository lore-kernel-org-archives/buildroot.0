From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Apr 2015 00:32:04 +0200
Subject: [Buildroot] [PATCH] package: kill pointless text justification
In-Reply-To: <1429740874-8619-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429740874-8619-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150422223204.GG4069@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-22 19:14 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[--SNIP--]
> diff --git a/package/berkeleydb/Config.in b/package/berkeleydb/Config.in
> index ff1e386..5531b04 100644
> --- a/package/berkeleydb/Config.in
> +++ b/package/berkeleydb/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_BERKELEYDB
>  	bool "berkeleydb"
>  	help
> -	  The Berkeley database.  A very common library for database
> +	  The Berkeley database. A very common library for database

Well, it's not entirely incorrect.

English typography used to require there is a double-space (or two word
spaces, can't remeber the typographic name) between the full-stop and
the next sentence:

    https://en.wikipedia.org/wiki/Full_stop#Spacing_after_a_full_stop

However, this usage has been gradually declining in favour of a single
space, but is till widely used, especially when submitting manuscripts.

Well, except for us Froggies, who only always used single-spacing. ;-)

Regards,
Yann E. MORIN.

>  	  applications.
>  
>  	  http://www.sleepycat.com/products/db.shtml
> diff --git a/package/biosdevname/Config.in b/package/biosdevname/Config.in
> index ea2a7e6..f9202ac 100644
> --- a/package/biosdevname/Config.in
> +++ b/package/biosdevname/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_BIOSDEVNAME
>  	help
>  	  Biosdevname is a udev helper that looks at various BIOS tables to
>  	  figure out what the actual hardware names are for Ethernet ports
> -	  and renames the ports accordingly.  This has the advantage of
> +	  and renames the ports accordingly. This has the advantage of
>  	  always referring to the same port regardless of system or
>  	  hardware changes that might otherwise alter the typical ethX
>  	  naming.
> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> index 0131822..5c6a466 100644
> --- a/package/bluez5_utils/Config.in
> +++ b/package/bluez5_utils/Config.in
> @@ -44,7 +44,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
>  	help
>  	  Generic Attribute Profile (GATT) support. This provides
>  	  profile discovery and description services for Bluetooth Low
> -	  Energy.  This will install the gatttool utility.
> +	  Energy. This will install the gatttool utility.
>  
>  	  It is always built with BlueZ 5.x, but upstream choose not
>  	  to install it by default.
> diff --git a/package/boa/Config.in b/package/boa/Config.in
> index 982833a..cb085a2 100644
> --- a/package/boa/Config.in
> +++ b/package/boa/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_BOA
>  	bool "boa"
>  	depends on BR2_USE_MMU # uses fork()
>  	help
> -	  A very small and very fast http daemon.  Not intended as
> +	  A very small and very fast http daemon. Not intended as
>  	  a feature-packed server.
>  
>  	  http://www.boa.org/
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index f2f2990..b4f949f 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_BUSYBOX
>  	bool "BusyBox"
>  	default y
>  	help
> -	  The Swiss Army Knife of embedded Linux.  It slices, it dices, it
> +	  The Swiss Army Knife of embedded Linux. It slices, it dices, it
>  	  makes Julian Fries.
>  
>  	  http://busybox.net/
> diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
> index eee041d..d9f614a 100644
> --- a/package/coreutils/Config.in
> +++ b/package/coreutils/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_COREUTILS
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_USE_MMU # fork()
>  	help
> -	  All of the basic file/text/shell utilities.  These are the
> +	  All of the basic file/text/shell utilities. These are the
>  	  core utilities which are expected to exist on every system.
>  	  BusyBox implements many of the most common.
>  
> diff --git a/package/cppunit/Config.in b/package/cppunit/Config.in
> index f349fb3..efcdcf0 100644
> --- a/package/cppunit/Config.in
> +++ b/package/cppunit/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_CPPUNIT
>  	depends on !BR2_STATIC_LIBS
>  	help
>  	  CppUnit is the C++ port of the famous JUnit framework for
> -	  unit testing.  Test output is in XML or text format for
> +	  unit testing. Test output is in XML or text format for
>  	  automatic testing and GUI based for supervised tests.
>  
>  	  http://www.freedesktop.org/wiki/Software/cppunit/
> diff --git a/package/dcron/Config.in b/package/dcron/Config.in
> index 42f246a..0f4ffc9 100644
> --- a/package/dcron/Config.in
> +++ b/package/dcron/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_DCRON
>  	depends on BR2_USE_MMU # fork()
>  	help
>  	  dcron is a time-based job scheduler with anacron-like
> -	  features.  It works as a background daemon that parses
> +	  features. It works as a background daemon that parses
>  	  individual crontab files and executes commands on behalf of
>  	  the users in question.
>  
> diff --git a/package/dialog/Config.in b/package/dialog/Config.in
> index fc0e8fd..73b7176 100644
> --- a/package/dialog/Config.in
> +++ b/package/dialog/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_DIALOG
>  	  dialog - display dialog boxes from shell scripts
>  
>  	  This application provides a method of displaying several different
> -	  types of dialog boxes from shell scripts.  This allows a developer
> +	  types of dialog boxes from shell scripts. This allows a developer
>  	  of a script to interact with the user in a much friendlier manner.
>  
>  	  http://invisible-island.net/dialog/dialog.html
> diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
> index 4926c95..9e1c462 100644
> --- a/package/dnsmasq/Config.in
> +++ b/package/dnsmasq/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_DNSMASQ
>  	bool "dnsmasq"
>  	help
> -	  A lightweight DNS and DHCP server.  It is intended to provide
> +	  A lightweight DNS and DHCP server. It is intended to provide
>  	  coupled DNS and DHCP service to a LAN.
>  
>  	  http://www.thekelleys.org.uk/dnsmasq/
> diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
> index 8d80479..5fc55a6 100644
> --- a/package/e2tools/Config.in
> +++ b/package/e2tools/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_E2TOOLS
>  	depends on BR2_USE_MMU # e2fsprogs
>  	help
>  	  E2tools is a simple set of GPL'ed utilities to read, write,
> -	  and manipulate files in an ext2/ext3 filesystem.  These
> +	  and manipulate files in an ext2/ext3 filesystem. These
>  	  utilities access a filesystem directly using the ext2fs
>  	  library.
>  
> diff --git a/package/ed/Config.in b/package/ed/Config.in
> index 63dc21e..21ba79e 100644
> --- a/package/ed/Config.in
> +++ b/package/ed/Config.in
> @@ -1,8 +1,8 @@
>  config BR2_PACKAGE_ED
>  	bool "ed"
>  	help
> -	  A line-oriented text editor.  Used to create, display, modify,
> -	  and otherwise manipulate text files.  Often used in scripts
> +	  A line-oriented text editor. Used to create, display, modify,
> +	  and otherwise manipulate text files. Often used in scripts
>  	  rather than invoked directly.
>  
>  	  http://www.gnu.org/software/ed/
> diff --git a/package/fftw/Config.in b/package/fftw/Config.in
> index d9a65d5..ef11384 100644
> --- a/package/fftw/Config.in
> +++ b/package/fftw/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_FFTW
>  	  Library for computing Fast Fourier Transforms.
>  
>  	  This library computes Fast Fourier Transforms (FFT) in one
> -	  or more dimensions.  It is extremely fast. This package
> +	  or more dimensions. It is extremely fast. This package
>  	  contains the shared library version of the fftw libraries in
>  	  double precision.
>  
> diff --git a/package/findutils/Config.in b/package/findutils/Config.in
> index b719d4f..c93d9d8 100644
> --- a/package/findutils/Config.in
> +++ b/package/findutils/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_FINDUTILS
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_USE_MMU # fork()
>  	help
> -	  Basic directory searching utilities.  Provides the
> +	  Basic directory searching utilities. Provides the
>  	  common 'find', 'xargs', 'locate', and 'updatedb' binaries.
>  
>  	  http://www.gnu.org/software/findutils/findutils.html
> diff --git a/package/flex/Config.in b/package/flex/Config.in
> index 7199c6a..0a70a1c 100644
> --- a/package/flex/Config.in
> +++ b/package/flex/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_FLEX
>  	bool "flex"
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	help
> -	  A fast lexical analyser generator.  A tool for generating
> +	  A fast lexical analyser generator. A tool for generating
>  	  programs that perform pattern-matching on text.
>  
>  	  http://flex.sourceforge.net/
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> index 4e83dd3..c59535e 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> @@ -16,7 +16,7 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>  	  Userspace libraries for Vivante GPU on i.MX6 platforms
>  
>  	  It contains libraries and headers for GLES, OpenCL, and
> -	  OpenVG.  It also contains a DRI plugin for X11. It also
> +	  OpenVG. It also contains a DRI plugin for X11. It also
>  	  contains a plugin for DirectFB-1.4.0, but that doesn't work
>  	  together with buildroot's DirectFB version.
>  
> diff --git a/package/gawk/Config.in b/package/gawk/Config.in
> index 5b4d818..949f509 100644
> --- a/package/gawk/Config.in
> +++ b/package/gawk/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_GAWK
>  	depends on !BR2_STATIC_LIBS
>  	help
>  	  A special-purpose programming language which is data driven
> -	  rather than procedural.  Allows for simple data-reformatting jobs
> +	  rather than procedural. Allows for simple data-reformatting jobs
>  	  with just a few lines of code.
>  
>  	  http://www.gnu.org/software/gawk/
> diff --git a/package/genext2fs/Config.in b/package/genext2fs/Config.in
> index d119160..2251684 100644
> --- a/package/genext2fs/Config.in
> +++ b/package/genext2fs/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_GENEXT2FS
>  	bool "genext2fs"
>  	help
>  	  genext2fs generates an ext2 filesystem as a normal (non-root)
> -	  user.  It does not require you to mount the image file to
> +	  user. It does not require you to mount the image file to
>  	  copy files on it, nor does it require that you become the
>  	  superuser to make device nodes.
>  
> diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
> index 146db36..a95bf63 100644
> --- a/package/google-breakpad/Config.in
> +++ b/package/google-breakpad/Config.in
> @@ -13,7 +13,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
>  	  to distribute an application to users with compiler-provided
>  	  debugging information removed, record crashes in compact
>  	  "minidump" files, send them back to your server, and produce
> -	  C and C++ stack traces from these minidumps.  Breakpad can
> +	  C and C++ stack traces from these minidumps. Breakpad can
>  	  also write minidumps on request for programs that have not
>  	  crashed.
>  
> diff --git a/package/gsl/Config.in b/package/gsl/Config.in
> index aa431d1..5b82ac2 100644
> --- a/package/gsl/Config.in
> +++ b/package/gsl/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_GSL
>  	bool "gsl"
>  	help
>  	  The GNU Scientific Library (GSL) is a numerical library for
> -	  C and C++ programmers.  The library provides a wide range of
> +	  C and C++ programmers. The library provides a wide range of
>  	  mathematical routines such as random number generators,
>  	  special functions and least-squares fitting. There are over
>  	  1000 functions in total with an extensive test suite.
> diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
> index c89070f..cc9b497 100644
> --- a/package/gstreamer/gst-ffmpeg/Config.in
> +++ b/package/gstreamer/gst-ffmpeg/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_GST_FFMPEG
>  	select BR2_PACKAGE_GST_PLUGINS_BASE
>  	help
>  	  GStreamer plugin containing one plugin with a set of elements using
> -	  the Libav library.  It contains most popular decoders as well as
> +	  the Libav library. It contains most popular decoders as well as
>  	  colorspace conversion elements.
>  
>  	  This package is configured to use an internal copy of the Libav
> @@ -16,7 +16,7 @@ if BR2_PACKAGE_GST_FFMPEG
>  config BR2_PACKAGE_GST_FFMPEG_GPL
>  	bool "Enable GPL code"
>  	help
> -	  Allow use of GPL code.  The resulting libs and binaries will
> +	  Allow use of GPL code. The resulting libs and binaries will
>  	  be under GPL.
>  
>  endif
> diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
> index 22dc426..0d8dd62 100644
> --- a/package/gstreamer1/gstreamer1/Config.in
> +++ b/package/gstreamer1/gstreamer1/Config.in
> @@ -23,7 +23,7 @@ config BR2_PACKAGE_GSTREAMER1_TRACE
>  	bool "enable tracing subsystem"
>  	default y
>  	help
> -	  Enable the tracing subsystem within gstreamer.  This may increase CPU
> +	  Enable the tracing subsystem within gstreamer. This may increase CPU
>  	  overhead by a small amount.
>  
>  config BR2_PACKAGE_GSTREAMER1_GST_DEBUG
> diff --git a/package/gzip/Config.in b/package/gzip/Config.in
> index b30c1ca..a251425 100644
> --- a/package/gzip/Config.in
> +++ b/package/gzip/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_GZIP
>  	bool "gzip"
>  	depends on BR2_USE_WCHAR
>  	help
> -	  Standard GNU compressor.  Provides things like gzip,
> +	  Standard GNU compressor. Provides things like gzip,
>  	  gunzip, gzcat, etc...
>  
>  	  http://www.gnu.org/software/gzip/gzip.html
> diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
> index 4da0d2b..0662492 100644
> --- a/package/iproute2/Config.in
> +++ b/package/iproute2/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_IPROUTE2
>  	bool "iproute2"
>  	depends on BR2_USE_MMU # fork()
>  	help
> -	  Kernel routing and traffic control utilities.  Provides things
> +	  Kernel routing and traffic control utilities. Provides things
>  	  like ip and tc.
>  
>  	  http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2
> diff --git a/package/jack2/Config.in b/package/jack2/Config.in
> index 04249a1..eeeb8da 100644
> --- a/package/jack2/Config.in
> +++ b/package/jack2/Config.in
> @@ -15,7 +15,7 @@ config BR2_PACKAGE_JACK2
>  
>  	  JACK is a low-latency sound server, allowing multiple
>  	  applications to connect to one audio device, and to share
> -	  audio between themselves.  This package contains the daemon
> +	  audio between themselves. This package contains the daemon
>  	  jackd as well as some example clients.
>  
>  	  http://jackaudio.org/
> diff --git a/package/jimtcl/Config.in b/package/jimtcl/Config.in
> index 1324590..635fef1 100644
> --- a/package/jimtcl/Config.in
> +++ b/package/jimtcl/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_JIMTCL
>  	bool "jimtcl"
>  	help
>  	  Jim Tcl is a small footprint reimplementation of the Tcl
> -	  scripting language.  The core language engine is compatible
> +	  scripting language. The core language engine is compatible
>  	  with Tcl 8.5+, while implementing a significant subset of
>  	  the Tcl 8.6 command set, plus additional features available
>  	  only in Jim Tcl.
> diff --git a/package/joe/Config.in b/package/joe/Config.in
> index 7b3df82..eabfae7 100644
> --- a/package/joe/Config.in
> +++ b/package/joe/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_JOE
>  
>  	  JOE is an easy-to-use, full featured terminal-based screen editor.
>  	  Its behavior is a blending of WordStar and GNU-EMACS (but it does
> -	  not use code from either program).  It is a great editor for new
> +	  not use code from either program). It is a great editor for new
>  	  users or as an alternative to vi.
>  
>  	  http://joe-editor.sf.net
> diff --git a/package/jsoncpp/Config.in b/package/jsoncpp/Config.in
> index 3ec02e1..2c96f13 100644
> --- a/package/jsoncpp/Config.in
> +++ b/package/jsoncpp/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_JSONCPP
>  	help
>  	  JsonCpp is a C++ library that allows manipulating JSON
>  	  values, including serialization and deserialization to and
> -	  from strings.  It can also preserve existing comment in
> +	  from strings. It can also preserve existing comment in
>  	  unserialization/serialization steps, making it a convenient
>  	  format to store user input files.
>  
> diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
> index 4610145..4f0a6ba 100644
> --- a/package/libassuan/Config.in
> +++ b/package/libassuan/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBASSUAN
>  	  Assuan protocol.
>  
>  	  This protocol is used for IPC between most newer GnuPG
> -	  components.  Both, server and client side functions are
> +	  components. Both, server and client side functions are
>  	  provided.
>  
>  	  http://www.gnupg.org/related_software/libassuan/
> diff --git a/package/libexif/Config.in b/package/libexif/Config.in
> index 9c89df4..8a38b47 100644
> --- a/package/libexif/Config.in
> +++ b/package/libexif/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBEXIF
>  	help
>  	  Most digital cameras produce EXIF files, which are JPEG
>  	  files with extra tags that contain information about the
> -	  image.  The EXIF library allows you to parse an EXIF file
> +	  image. The EXIF library allows you to parse an EXIF file
>  	  and read the data from those tags.
>  
>  	  http://libexif.sf.net
> diff --git a/package/libmad/Config.in b/package/libmad/Config.in
> index d0edc49..7d66976 100644
> --- a/package/libmad/Config.in
> +++ b/package/libmad/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_LIBMAD
>  	bool "libmad"
>  	help
> -	  High-quality MPEG audio decoder.  All computations are performed
> +	  High-quality MPEG audio decoder. All computations are performed
>  	  with fixed-point integer arithmetic, making it ideal for systems
>  	  without a floating-point unit.
>  
> diff --git a/package/libshout/Config.in b/package/libshout/Config.in
> index 9029342..02248c7 100644
> --- a/package/libshout/Config.in
> +++ b/package/libshout/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBSHOUT
>  	select BR2_PACKAGE_LIBVORBIS
>  	help
>  	  Libshout is a library for communicating with and sending data to an
> -	  icecast server.  It handles the socket connection, the timing of the
> +	  icecast server. It handles the socket connection, the timing of the
>  	  data, and prevents bad data from getting to the icecast server.
>  
>  	  http://icecast.org/download/
> diff --git a/package/ltris/Config.in b/package/ltris/Config.in
> index d13531b..bf73489 100644
> --- a/package/ltris/Config.in
> +++ b/package/ltris/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_LTRIS
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	help
>  	  LTris is a tetris clone, using SDL. It optionally requires
> -	  SDL_mixer for audio support.  A display with minimum 640x480
> +	  SDL_mixer for audio support. A display with minimum 640x480
>  	  resolution and a keyboard are recommended.
>  
>  	  http://lgames.sourceforge.net/index.php?project=LTris
> diff --git a/package/lua/Config.in b/package/lua/Config.in
> index d9f85e2..d9cd1dd 100644
> --- a/package/lua/Config.in
> +++ b/package/lua/Config.in
> @@ -39,7 +39,7 @@ config BR2_PACKAGE_LUA_32BITS
>  	default y if !BR2_ARCH_IS_64
>  	help
>  	  Use a 32 bit data type for numbers / integers instead of the
> -	  default 64 bit type.  This option is particularly attractive
> +	  default 64 bit type. This option is particularly attractive
>  	  for small machines and embedded systems.
>  
>  endif
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index ff3b24e..2d19d69 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -133,7 +133,7 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
>  	bool "OpenGL ES"
>  	select BR2_PACKAGE_HAS_LIBGLES
>  	help
> -	  Use the Khronos OpenGL ES APIs.  This is commonly used on embedded
> +	  Use the Khronos OpenGL ES APIs. This is commonly used on embedded
>  	  systems and represents a subset of the OpenGL API.
>  
>  endif # BR2_PACKAGE_MESA3D_DRIVER
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 5e19297..41a4d54 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -266,7 +266,7 @@ config BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT
>  	  This option can be used in conjunction with the smbclient
>  	  plugin to provide a list of SMB/CIFS servers or with the
>  	  UPnP plugin to provide a list of UPnP servers on the local
> -	  network.  The neighbor plugin needs configuration in
> +	  network. The neighbor plugin needs configuration in
>  	  mpd.conf. For further information take a look at the MPD
>  	  documentation.
>  
> diff --git a/package/mpg123/Config.in b/package/mpg123/Config.in
> index a7ac035..eacefad 100644
> --- a/package/mpg123/Config.in
> +++ b/package/mpg123/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_MPG123
>  	bool "mpg123"
>  	depends on BR2_USE_MMU # fork - in the application
>  	help
> -	  Fast, free and portable MPEG audio player for Unix.  It supports
> +	  Fast, free and portable MPEG audio player for Unix. It supports
>  	  MPEG 1.0/2.0 layers 1, 2 and 3.
>  
>  	  http://www.mpg123.de/
> diff --git a/package/nginx/Config.in b/package/nginx/Config.in
> index cfbba73..be445f4 100644
> --- a/package/nginx/Config.in
> +++ b/package/nginx/Config.in
> @@ -13,7 +13,7 @@ config BR2_PACKAGE_NGINX_FILE_AIO
>  	bool "file AIO support"
>  	# Does not build, because nginx hardcodes using SYS_eventfd,
>  	# but it's available on neither AArch64 nor ARC where only
> -	# eventfd() is available.  See
> +	# eventfd() is available. See
>  	# https://bugs.launchpad.net/linaro-aarch64/+bug/1160013
>  	depends on !BR2_aarch64
>  	depends on !BR2_arc
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index d044c8e..3140683 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -58,7 +58,7 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL
>  	help
>  	  List of space-separated nodejs modules to install via npm.
>  	  See https://npmjs.org/ to find modules and 'npm help install'
> -	  for available installation methods.  For repeatable builds,
> +	  for available installation methods. For repeatable builds,
>  	  download and save tgz files or clone git repos for the
>  	  components you care about.
>  
> @@ -72,7 +72,7 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
>  	string "Additional module dependencies"
>  	help
>  	  List of space-separated buildroot recipes which must be built before
> -	  your npms can be installed.  For example, if in 'Additional modules'
> +	  your npms can be installed. For example, if in 'Additional modules'
>  	  you specified 'node-curl' (see:
>  	  https://github.com/jiangmiao/node-curl), you could then specify
>  	  'libcurl' here, to ensure that buildroot builds the libcurl package,
> diff --git a/package/openssh/Config.in b/package/openssh/Config.in
> index 78cc615..7591140 100644
> --- a/package/openssh/Config.in
> +++ b/package/openssh/Config.in
> @@ -5,6 +5,6 @@ config BR2_PACKAGE_OPENSSH
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  A free version of the SSH protocol suite of network connectivity
> -	  tools.  The standard 'ssh', 'sshd', 'scp', and friends.
> +	  tools. The standard 'ssh', 'sshd', 'scp', and friends.
>  
>  	  http://www.openssh.com/
> diff --git a/package/polkit/Config.in b/package/polkit/Config.in
> index d685e5c..debd1d9 100644
> --- a/package/polkit/Config.in
> +++ b/package/polkit/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_POLKIT
>  	select BR2_PACKAGE_EXPAT
>  	help
>  	  PolicyKit is a toolkit for defining and handling
> -	  authorizations.  It is used for allowing unprivileged
> +	  authorizations. It is used for allowing unprivileged
>  	  processes to speak to privileged processes.
>  
>  	  http://www.freedesktop.org/wiki/Software/polkit
> diff --git a/package/python-cffi/Config.in b/package/python-cffi/Config.in
> index 9cbfcfb..3805d3d 100644
> --- a/package/python-cffi/Config.in
> +++ b/package/python-cffi/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_CFFI
>  	select BR2_PACKAGE_LIBFFI
>  	help
>  	  This is the Foreign Function Interface for Python calling C
> -	  code.  The aim of this project is to provide a convenient
> +	  code. The aim of this project is to provide a convenient
>  	  and reliable way of calling C code from Python.
>  
>  	  https://pypi.python.org/pypi/cffi
> diff --git a/package/python-docopt/Config.in b/package/python-docopt/Config.in
> index a3a482f..9942d67 100644
> --- a/package/python-docopt/Config.in
> +++ b/package/python-docopt/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_DOCOPT
>  	bool "python-docopt"
>  	help
>  	  docopt helps you create most beautiful command-line
> -	  interfaces easily.  The option parser is generated based on
> +	  interfaces easily. The option parser is generated based on
>  	  the beautiful help message that you write yourself. This way
>  	  you don't need to write this stupid repeatable parser-code,
>  	  and instead can write only the help message-- the way you
> diff --git a/package/qlibc/Config.in b/package/qlibc/Config.in
> index c6d4f39..170da49 100644
> --- a/package/qlibc/Config.in
> +++ b/package/qlibc/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_QLIBC
>  	depends on !BR2_STATIC_LIBS
>  	help
>  	  qLibc is currently one of the most functionally complete
> -	  public licensed C/C++ libraries.  The C/C++ library which
> +	  public licensed C/C++ libraries. The C/C++ library which
>  	  includes all kinds of containers and general library
>  	  routines. It provides ready-made set of common container
>  	  APIs with consistant API look.
> diff --git a/package/read-edid/Config.in b/package/read-edid/Config.in
> index f1ad1c4..a4668e6 100644
> --- a/package/read-edid/Config.in
> +++ b/package/read-edid/Config.in
> @@ -2,10 +2,10 @@ config BR2_PACKAGE_READ_EDID
>  	bool "read-edid"
>  	help
>  	  Read-edid is a pair of tools for reading the EDID from a
> -	  monitor.  It should work with most monitors made since 1996
> +	  monitor. It should work with most monitors made since 1996
>  	  (except for newer ones with 256-byte EDID's - WiP), assuming
>  	  the video card supports the standard read commands (most
> -	  do).  Read-edid is a set of two tools - get-edid, which gets
> +	  do). Read-edid is a set of two tools - get-edid, which gets
>  	  the raw edid information from the monitor, and parse-edid,
>  	  which turns the raw binary information into an
>  	  XF86Config-compatible monitor section.
> diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
> index 668a443..d37203c 100644
> --- a/package/rp-pppoe/Config.in
> +++ b/package/rp-pppoe/Config.in
> @@ -3,9 +3,9 @@ config BR2_PACKAGE_RP_PPPOE
>  	depends on BR2_PACKAGE_PPPD
>  	help
>  	  An implementation of the Point-to-point protocol over Ethernet.
> -	  Has userspace client and server deamons.  You likely only need
> +	  Has userspace client and server deamons. You likely only need
>  	  this package if you are implementing the pppoe server that will
> -	  service other pppoe client devices.  Otherwise the normal client
> +	  service other pppoe client devices. Otherwise the normal client
>  	  functionality already exists in the pppd package (and kernel).
>  
>  	  http://www.roaringpenguin.com/pppoe.html
> diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
> index 00cbac5..218b47c 100644
> --- a/package/rsh-redone/Config.in
> +++ b/package/rsh-redone/Config.in
> @@ -2,8 +2,8 @@ config BR2_PACKAGE_RSH_REDONE
>  	bool "rsh-redone"
>  	help
>  	  Rsh-redone is a reimplementation of the remote shell clients and
> -	  servers.  It is written from the ground up to avoid the bugs found
> -	  in the standard clients and servers.  It also fully supports IPv6.
> +	  servers. It is written from the ground up to avoid the bugs found
> +	  in the standard clients and servers. It also fully supports IPv6.
>  
>  	  http://packages.debian.org/source/sid/rsh-redone
>  
> diff --git a/package/sispmctl/Config.in b/package/sispmctl/Config.in
> index 3b8f60e..976b08f 100644
> --- a/package/sispmctl/Config.in
> +++ b/package/sispmctl/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_SISPMCTL
>  	help
>  	  sispmctl is an application enabling the use of the GEMBIRD
>  	  SiS-PM and mSiS(sispm) USB-controlled power-outlet device
> -	  under Linux.  Note that the device is also sold under
> +	  under Linux. Note that the device is also sold under
>  	  different Names, i.e. as "IntelliPlug" in Germany.
>  
>  	  http://sispmctl.sourceforge.net/
> diff --git a/package/smcroute/Config.in b/package/smcroute/Config.in
> index f9a81f6..f104075 100755
> --- a/package/smcroute/Config.in
> +++ b/package/smcroute/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_SMCROUTE
>  	help
>  	  SMCRoute is a command line tool to manipulate the multicast
>  	  routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast
> -	  routing.  SMCRoute can be used as an alternative to dynamic
> +	  routing. SMCRoute can be used as an alternative to dynamic
>  	  multicast routers like mrouted or pimd in setups where static
>  	  multicast routes should be maintained and/or no proper IGMP or
>  	  MLD signaling exists.
> diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
> index 484340f..98b2f89 100644
> --- a/package/sqlcipher/Config.in
> +++ b/package/sqlcipher/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_SQLCIPHER
>  	select BR2_PACKAGE_OPENSSL
>  	help
>  	  SQLCipher is an SQLite extension that provides 256 bits AES
> -	  encryption of database files.  Note that it is a fork of SQLite
> +	  encryption of database files. Note that it is a fork of SQLite
>  	  and they cannot be installed side-by-side.
>  
>  	  http://sqlcipher.net
> diff --git a/package/sudo/Config.in b/package/sudo/Config.in
> index cd7ab81..cbef15d 100644
> --- a/package/sudo/Config.in
> +++ b/package/sudo/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_SUDO
>  	depends on BR2_USE_MMU
>  	help
>  	  Sudo is a program designed to allow a sysadmin to give
> -	  limited root privileges to users and log root activity.  The
> +	  limited root privileges to users and log root activity. The
>  	  basic philosophy is to give as few privileges as possible
>  	  but still allow people to get their work done.
>  
> diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
> index c95ebbb..95f91ab 100644
> --- a/package/sunxi-mali/Config.in
> +++ b/package/sunxi-mali/Config.in
> @@ -34,7 +34,7 @@ choice
>  	prompt "Version"
>  	default BR2_PACKAGE_SUNXI_MALI_R3P0
>  	help
> -	  Select the version of the kernel module.  For the sunxi-kernel, the
> +	  Select the version of the kernel module. For the sunxi-kernel, the
>  	  appropriate version number is r3p0. For other kernels, use the maliver
>  	  application to determine the appropriate version.
>  
> diff --git a/package/szip/Config.in b/package/szip/Config.in
> index 0c5d9b0..5a24362 100644
> --- a/package/szip/Config.in
> +++ b/package/szip/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_SZIP
>  	  standards for space applications[1,6,7]. Szip is reported to
>  	  provide fast and effective compression, specifically for the
>  	  EOS data generated by the NASA Earth Observatory System
> -	  (EOS)[1].  It was originally developed at University of New
> +	  (EOS)[1]. It was originally developed at University of New
>  	  Mexico (UNM) and integrated with HDF4 by UNM researchers and
>  	  developers.
>  
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> index 46322a0..d4c8a89 100644
> --- a/package/xenomai/Config.in
> +++ b/package/xenomai/Config.in
> @@ -36,7 +36,7 @@ if BR2_PACKAGE_XENOMAI
>  config BR2_PACKAGE_XENOMAI_VERSION
>  	string "Custom Xenomai version"
>  	help
> -	  Manually select Xenomai version.  If left empty, the default
> +	  Manually select Xenomai version. If left empty, the default
>  	  version will be used.
>  
>  	  Make sure that the selected version has a patch for your
> diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
> index 00fc048..9277653 100644
> --- a/package/zeromq/Config.in
> +++ b/package/zeromq/Config.in
> @@ -15,7 +15,7 @@ config BR2_PACKAGE_ZEROMQ
>  	  sockets that carry whole messages across various transports
>  	  like in-process, inter- process, TCP, and multicast. You can
>  	  connect sockets N-to-N with patterns like fanout, pub-sub,
> -	  task distribution, and request-reply.  It's fast enough to
> +	  task distribution, and request-reply. It's fast enough to
>  	  be the fabric for clustered products. Its asynchronous I/O
>  	  model gives you scalable multicore applications, built as
>  	  asynchronous message-processing tasks. It has a score of
> diff --git a/package/zlib/Config.in b/package/zlib/Config.in
> index 8954214..f623304 100644
> --- a/package/zlib/Config.in
> +++ b/package/zlib/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_ZLIB
>  	bool "zlib"
>  	help
> -	  Standard (de)compression library.  Used by things like
> +	  Standard (de)compression library. Used by things like
>  	  gzip and libpng.
>  
>  	  http://www.gzip.org/zlib/
> -- 
> 2.0.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
