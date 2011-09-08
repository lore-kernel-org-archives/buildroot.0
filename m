From: Heiko Helmle <helman@gmx.net>
Date: Thu, 8 Sep 2011 19:56:37 +0200
Subject: [Buildroot] Keyboard trouble with TinyX
Message-ID: <20110908195637.2f48d694@verflixtsl6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to build a X-enabled buildroot system. I built tinyX on x86.
It starts fine and querys a login via XDMCP - but the keyboard isn't
working.

When using this line: 
Xfbdev -query xhost :1 -mouse mouse -keybd keyboard

mouse works, but the keyboard doesn't respond at all (vt switch isn't
working either - I have to switch back via 'chvt' run from a background
script).

The console shows this:
"driver Linux console keyboard wanted to post scancode 30 outside of
[0, 0]!"

I'm not really sure if this is a tinyX bug or a configuration error.
Documentation on tinyX/kdrive is hard to find. Does anyone on this list
have a little experience with this?

Best Regards
	Heiko
