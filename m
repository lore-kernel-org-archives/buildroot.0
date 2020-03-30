From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 29 Mar 2020 23:33:32 -0600
Subject: [Buildroot] [PATCH 1/1] package/swupdate: add optional systemd
 dependency
In-Reply-To: <20200330072649.2c03052d@windsurf.home>
References: <20200330002649.36004-1-james.hilliard1@gmail.com>
 <20200330072649.2c03052d@windsurf.home>
Message-ID: <CADvTj4p1T=XvmZwqvXtpZv-BzpBpU9izZ_yvhzwohc0f_ySWzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 29, 2020 at 11:26 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 29 Mar 2020 18:26:49 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Fixes:
> > core/notifier.c:27:10: fatal error: systemd/sd-daemon.h: No such file or directory
> >    27 | #include <systemd/sd-daemon.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~
>
> Under what situations/configurations to you have this build failure.
> Because I don't immediately see how adding an optional dependency can
> fix such a build failure.
It happens when this is enabled:
https://github.com/sbabic/swupdate/blob/2019.11/Kconfig#L104-L110
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
