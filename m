From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Feb 2015 18:25:36 +0000 (UTC)
Subject: [Buildroot] [Bug 7874] X.org configure error
In-Reply-To: <bug-7874-163@https.bugs.busybox.net/>
References: <bug-7874-163@https.bugs.busybox.net/>
Message-ID: <20150220182536.8C042801F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7874

--- Comment #1 from bernd.kuhls at t-online.de 2015-02-20 18:25:35 UTC ---
I can not reproduce the bug:

checking whether make supports nested variables... (cached) yes
checking for XORG... yes
checking for UDEV... yes
checking for XI22... yes
checking for MTDEV... no
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/Makefile
config.status: creating man/Makefile
config.status: creating include/Makefile
config.status: creating xorg-evdev.pc
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
configure: WARNING: unrecognized options: --disable-gtk-doc,
--disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation,
--with-xmlto, --with-fop, --enable-ipv6, --disable-debug
>>> xdriver_xf86-input-evdev 2.8.2 Building

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
