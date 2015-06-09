From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:12:21 +0200
Subject: [Buildroot] [PATCH 0/32 v2] matchbox: huge cleanups (branch
 yem/matchbox)
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <20150609231221.5754aa31@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  3 Jun 2015 22:41:44 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (32):
>       package/matchbox-wm: drop useless commented options
>       package/matchbox: make matchbox-lib a real package
>       package/matchbox: make matchbox-wm a real package
>       package/matchbox: make matchbox-panel a real package
>       package/matchbox: make matchbox-desktop a real package
>       package/matchbox: make matchbox-common a real package
>       package/matchbox: make matchbox-fakekey a real package
>       package/matchbox: make matchbox-keyboard a real package
>       package/matchbox: make match-startup-monitor a real package
>       package/matchbox: remove superfluous conditional includes
>       package/matchbox: point to new home
>       package/matchbox: get rid of intermediate non-package matchbox
>       package/matchbox-common: move one directory higher
>       package/matchbox: fix option prompts
>       package/matchbox: add missing dependencies to matchbox-lib
>       package/matchbox-common: fix dependencies
>       package/matchbox-fakekey: add missing dependency
>       package/matchbox: finally add prompts to all sub-packages
>       package/matchbox-startup-monitor: invert dependency chain
>       package/matchbox: forcibly disable gconf
>       package/matchbox: forcibly disable support for compositing
>       package/matchbox: make it a menu
>       package/matchbox: enable support for the Xsession manager
>       package/matchbox: drop useless dependencies
>       package/matchbox-keyboard: enforce disabling support for cairo
>       package/matchbox-common: explicitly disable PDA folders when not selected
>       package/matchbox: wrap long lines
>       package/matchbox: xlib-libXcursor is an optional dependency
>       package/matchbox: xlib_libXfixes is an optional dependency
>       package/matchbox-panel: use ACPI for the battery applet
>       package/matchbox-panel: add support for dnotify
>       package/matchbox-panel: fix WiFi monitoring

Entire series applied. Thanks a lot to you for having worked on
Matchbox, and to Arnout for the review work.

Please have a look at the comment I made against patch 16. For the
rest, it seemed to be alright, and even if there are minor issues, it's
still much much better than what existed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
