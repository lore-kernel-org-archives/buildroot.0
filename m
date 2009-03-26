From: Ed Stafford <ed.stafford@gmail.com>
Date: Thu, 26 Mar 2009 13:43:48 -0500
Subject: [Buildroot] Error building libX11 on Buildroot 0.90.2 stable
Message-ID: <41370a610903261143r9ec110cu2edeaa3c6136cafd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What I read was the keysymdef.h header is in the XProto package which
it indicates is available.  Any idea?

checking for cpp... /usr/bin/cpp
checking if /usr/bin/cpp requires -undef... yes
checking if /usr/bin/cpp requires -traditional... yes
checking whether to use XCB... (cached) yes
checking pkg-config is at least version 0.9.0... yes
checking for XPROTO... yes
checking for X11... yes
checking if Xtrans should support UNIX socket connections... yes
checking if Xtrans should support TCP socket connections... yes
checking for library containing socket... none required
checking for library containing gethostbyname... none required
checking for getaddrinfo... yes
checking if IPv6 support should be built... yes
checking for struct sockaddr_in.sin_len... no
checking if Xtrans should support os-specific local connections... no
checking for authdes_seccreate... no
checking for authdes_create... no
checking if Secure RPC authentication ("SUN-DES-1") should be supported... no
checking if run-time linking is supported... checking for library
containing dlopen... -ldl
checking for dlfcn.h... (cached) yes
yes
checking if loadable i18n module support should be enabled... no
checking if loadable Xcursor library support should be enabled... yes
checking for ANSI C header files... (cached) yes
checking for strtol... yes
checking for issetugid... no
checking for getresuid... yes
checking for shmat... yes
checking for getpwuid_r in -lc... yes
checking for pthread_self in -lc... yes
checking for poll... yes
checking keysymdef.h... configure: error: Cannot find keysymdef.h
make: *** [/home/ed/src/buildroot-2009.02/build_i386/xlib_libX11-1.1.3/.stamp_configured]
Error 1
