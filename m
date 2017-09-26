From: John O'Sullivan <John.OSullivan@BlackBox.com>
Date: Tue, 26 Sep 2017 16:19:08 +0000
Subject: [Buildroot] Problem Building QT5 in Buildroot in buildroot-2017.02.4
Message-ID: <1506442747746.7350@BlackBox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I try and build QT5 in buildroot 2017.02.4 I get any error;

ERROR: Feature 'system-pcre' was enabled, but the pre-condition 'libs.pcre' failed.


Target packages                                                                                                                                                    ?
  ?       -> Libraries                                                                                                                                                        ?
  ?         -> Text and terminal handling

BR2_PACKAGE_PCRE and its available options have been selected


Any reason why I am getting this error


----------------------------

Full trace

--------------------------------

Running configuration tests...
Done running configuration tests.

Configure summary:


Building on:  x86_64
Building for: arm64
Configuration: cross_compile compile_examples enable_new_dtags largefile neon accessibility shared release c++11 c++14 c++1z concurrent mremap reduce_exports release_tools stl
Build options:
  Mode ................................... release; optimized tools
  Building shared libraries .............. yes
  Using C++ standard ..................... C++1z
  Using gold linker ...................... no
  Using new DTAGS ........................ yes
  Using precompiled headers .............. no
  Using LTCG ............................. no
  Target compiler supports:
    NEON ................................. yes
  Build parts ............................ libs
Qt modules and options:
  Qt Concurrent .......................... yes
  Qt D-Bus ............................... no
  Qt D-Bus directly linked to libdbus .... no
  Qt Gui ................................. yes
  Qt Widgets ............................. yes
Support enabled for:
  Accessibility .......................... yes
  Using pkg-config ....................... yes
  QML debugging .......................... yes
  udev ................................... no
  Using system zlib ...................... yes
Qt Core:
  DoubleConversion ....................... yes
    Using system DoubleConversion ........ no
  GLib ................................... no
  iconv .................................. no
  ICU .................................... no
  Logging backends:
    journald ............................. no
    syslog ............................... no
  Using system PCRE ...................... no
Qt Network:
  getaddrinfo() .......................... yes
  getifaddrs() ........................... yes
  IPv6 ifname ............................ yes
  libproxy ............................... no
  OpenSSL ................................ yes
    Qt directly linked to OpenSSL ........ no
  SCTP ................................... no
  Use system proxies ..................... yes
Qt Sql:
  DB2 (IBM) .............................. no
  InterBase .............................. no
  MySql .................................. no
  OCI (Oracle) ........................... no
  ODBC ................................... no
  PostgreSQL ............................. no
  SQLite2 ................................ no
  SQLite ................................. no
    Using system provided SQLite ......... no
  TDS (Sybase) ........................... no
Qt Gui:
  FreeType ............................... yes
    Using system FreeType ................ yes
  HarfBuzz ............................... yes
    Using system HarfBuzz ................ no
  Fontconfig ............................. no
  Image formats:
    GIF .................................. yes
    ICO .................................. yes
    JPEG ................................. yes
      Using system libjpeg ............... yes
    PNG .................................. yes
      Using system libpng ................ yes
  OpenGL:
    EGL .................................. no
    Desktop OpenGL ....................... no
    OpenGL ES 2.0 ........................ no
    OpenGL ES 3.0 ........................ no
    OpenGL ES 3.1 ........................ no
  Session Management ..................... yes
Features used by QPA backends:
  evdev .................................. yes
  libinput ............................... no
  mtdev .................................. no
  tslib .................................. no
  xkbcommon-evdev ........................ no
QPA backends:
  DirectFB ............................... yes
  EGLFS .................................. no
  LinuxFB ................................ no
  Mir client ............................. no
Qt Widgets:
  GTK+ ................................... no
  Styles ................................. Fusion Windows
Qt PrintSupport:
  CUPS ................................... no

Note: -optimized-tools is not useful in -release mode.

ERROR: Feature 'system-pcre' was enabled, but the pre-condition 'libs.pcre' failed.


________________________________

This email and any files transmitted with it are confidential and are intended for the sole use of the individual to whom they are addressed. Black Box Corporation reserves the right to scan all e-mail traffic for restricted content and to monitor all e-mail in general. If you are not the intended recipient or you have received this email in error, any use, dissemination or forwarding of this email is strictly prohibited. If you have received this email in error, please notify the sender by replying to this email.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170926/b4d9f89f/attachment.html>
