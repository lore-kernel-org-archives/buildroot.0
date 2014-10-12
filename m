From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 17:16:28 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Add optional
	package xlib_libXcomposite as dependency
In-Reply-To: <1412799995-20244-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Wed, 8 Oct 2014 22:26:35 +0200")
References: <1412799995-20244-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87tx39wc6r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Make sure that xlib_libXcomposite is build before xserver_xorg-server.
 > With this defconfig

 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_PACKAGE_XORG7=y
 > BR2_PACKAGE_XSERVER_XORG_SERVER=y
 > BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
 > BR2_PACKAGE_XLIB_LIBXCOMPOSITE=y

 > and "make xserver_xorg-server" the package xlib_libXcomposite was ignored.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
