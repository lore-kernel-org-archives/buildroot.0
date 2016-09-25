From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:19:00 +0200
Subject: [Buildroot] [PATCH 0/9] The wayland/weston/libgtk3 bump
In-Reply-To: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160925231900.25ab4522@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Sep 2016 14:28:33 -0300, Gustavo Zacarias wrote:
> This series bumps wayland/weston to the latest 1.12 release and gtk3+
> to it's latest 3.22.0 release.
> The series can't be split since these wayland/weston/gtk+ versions are
> protocol-version tied, i.e. gtk+ 3.22 won't work with any older
> wayland release.
> 
> Gustavo Zacarias (9):
>   wayland-protocols: bump to version 1.7
>   wayland: bump to version 1.12.0
>   weston: bump to version 1.12.0
>   legacy: add weston rpi support

I've merged this patch into the previous one. Indeed, we normally add
the Config.in.legacy entry in the same commit as the one removing the
option.

>   adwaita-icon-theme: bump to version 3.22.0
>   libgtk3: bump to version 3.22.0
>   glibmm: bump to version 2.50.0
>   libsigc: bump to version 2.10.0
>   gtkmm3: bump to version 3.22.0

All other patches applied as-is.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
