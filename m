From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:36:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm: disable
 gettext detection when not needed
In-Reply-To: <20180107175626.19944-1-bernd.kuhls@t-online.de>
References: <20180107175626.19944-1-bernd.kuhls@t-online.de>
Message-ID: <20180107213612.1c396628@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 18:56:26 +0100, Bernd Kuhls wrote:
> Patch originates from FreeBSD:
> https://lists.freebsd.org/pipermail/freebsd-x11/2015-July/016528.html
> https://svnweb.freebsd.org/ports/head/x11/libXpm/Makefile?r1=384234&r2=391122&pathrev=391122
> 
> Fixes
> http://autobuild.buildroot.net/results/f24/f24dc74c111690f068833ff6fc72df9a0853d210/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Not the nicest fix, but it is much simpler than fixing the gettext
integration in xlib_libXpm, so: applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
