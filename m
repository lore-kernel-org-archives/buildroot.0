From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 08:53:51 +0200
Subject: [Buildroot] [PATCH 3/5] package/x11r7/xserver_xorg-server:
 remove evdev input drivers for kdrive
In-Reply-To: <20210415065246.276882-3-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 15 Apr 2021 08:52:44 +0200")
References: <20210415065246.276882-1-bernd.kuhls@t-online.de>
 <20210415065246.276882-3-bernd.kuhls@t-online.de>
Message-ID: <87o8e1pmdc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Upstream removed the evdev driver for kdrive:
 > https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=27819950e4158326e0f83a30f2e8968b932625ef

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, thanks.

Without input drivers and xfbdev, kdrive probably isn't very useful
anymore, is it? Perhaps we should completely drop it?

-- 
Bye, Peter Korsgaard
