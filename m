From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Dec 2018 04:04:13 -0700
Subject: [Buildroot] [PATCH 1/1] package/meson: fix cpu_family format
In-Reply-To: <20181216115922.263866e0@windsurf.home>
References: <1544944395-2049-1-git-send-email-james.hilliard1@gmail.com>
 <20181216115922.263866e0@windsurf.home>
Message-ID: <CADvTj4qCbccUURtsqMKjkBmw8sn8we13hZMSwS30HZVEFNo3og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 16, 2018 at 3:59 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sun, 16 Dec 2018 15:13:15 +0800, james.hilliard1 at gmail.com wrote:
>
> > Meson expects the cpu_family to be in a specific format for
> > cross compilation, otherwise packages that use cpu_family
> > detection may fail to build.
For example systemd-boot will fail to build due to
https://github.com/systemd/systemd/blob/06da5c63dd697ea4087e76c6d809b60b5780b87c/meson.build#L1384-L1401
requiring the correct meson cpu_family format.
>
> Could you be more specific than "may fail to build" ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
