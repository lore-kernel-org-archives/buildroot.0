From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:36:16 +0200
Subject: [Buildroot] [PATCH v2] odroidc2: update boot.ini
In-Reply-To: <20160724052012.4964-1-daggs@gmx.com>
References: <20160724052012.4964-1-daggs@gmx.com>
Message-ID: <20160724153616.59dfa254@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 08:20:12 +0300, Dagg Stompler wrote:
> - fix disablehpd bug (thanks to Thomas for spotting it.)
> - change default HDMI mode to 1080p60hz.
> - add support for HDMI HotPlug Detection control.
> - add support for mason timer.
> - add support for headless boot
> 
> v1 -> v2:
> - bug fix (Thomas Petazzoni).
> - add more extensive commit msg (Thomas Petazzoni).

I've removed this changelog from the commit log and applied. Thanks a
lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
