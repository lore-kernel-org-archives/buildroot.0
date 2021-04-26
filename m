From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 08:51:42 +0200
Subject: [Buildroot] [PATCH 1/5] package/x11r7/xserver_xorg-server:
 remove non-evdev input drivers for kdrive
In-Reply-To: <20210415065246.276882-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 15 Apr 2021 08:52:42 +0200")
References: <20210415065246.276882-1-bernd.kuhls@t-online.de>
Message-ID: <87wnsppmgx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Upstream removed support for non-evdev input drivers for kdrive:
 > https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=e7b8b7b131d8283c96ed0aff4593ab41441b5d3b

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
