From: Gwyll Gwyllin <gwyll@gwyll.eu>
Date: Thu, 10 Oct 2013 14:16:14 +0200
Subject: [Buildroot] Xineramaproto
Message-ID: <233A67DA67A045DF84F76ABF9CA04635@tux.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello List,

i?m trying to cross compile (for MIPS) but i?m stucked at xserver_xorg-xserver-1.5.2


The compiler error says:

checking for a useful monotonic clock ...... cross compiling
checking for strcasecmp... yes
checking for strncasecmp... yes
checking for strcasestr... (cached) yes
checking for XDMCP... yes
checking for XdmcpWrap in -lXdmcp... yes
checking for XSERVERCFLAGS... configure: error: Package requirements (randrproto >= 1.2 renderproto fixesproto >= 4.0 damageproto >= 1.1 xcmiscproto xextproto xproto >= 7.0.9 xtrans scrnsaverproto >= 1.1 bigreqsproto resourceproto fontsproto inputproto >= 1.4.4 kbproto >= 1.0.3 videoproto compositeproto >= 0.4 resourceproto xineramaproto evieproto xkbfile xfont xau fontenc pixman-1 >= 0.9.5 dbus-1 xdmcp) were not met:

No package 'xineramaproto' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables XSERVERCFLAGS_CFLAGS
and XSERVERCFLAGS_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

pkg-config ?modversion xineramaproto says 1.1.2

I tried to set PKG_CONFIG_PATH to /usr/lib/pkg-config, the result was the same.

What should i set or try?

Thanks in advance,
Gwyll
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131010/30354058/attachment.html>
