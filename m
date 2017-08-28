From: =?utf-8?Q?Alexandre=20Maumen=C3=A9?= <alexandre@maumene.org>
Date: Mon, 28 Aug 2017 23:53:42 +0800
Subject: [Buildroot] Failed to build libexoxy with nvidia-driver
Message-ID: <1503935622.673191.1087468320.18EAD29A@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build libepoxy with nvidia-driver but it fails with this
error:

checking for EGL... no
configure: error: Package requirements (egl) were not met:

Package egl was not found in the pkg-config search path.
Perhaps you should add the directory containing `egl.pc'
to the PKG_CONFIG_PATH environment variable
Package 'egl', required by 'world', not found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables EGL_CFLAGS
and EGL_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

I'm new to buildroot and I don't know much about Nvidia binary drivers.
Any help will be more than welcome.

Regards,
