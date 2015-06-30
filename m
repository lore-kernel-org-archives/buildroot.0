From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 11:13:35 +0200
Subject: [Buildroot] [PATCH 4/4] configs/olimex_a20_olinuxino_micro: new
 board
In-Reply-To: <5592413B.6090508@lucaceresoli.net>
References: <1435615523-21039-1-git-send-email-luca@lucaceresoli.net>
 <1435615523-21039-4-git-send-email-luca@lucaceresoli.net>
 <CAB0FRssX3DheAt5K6GHq-jHr7=8FFw6SOirT59v5EcikjEDcZA@mail.gmail.com>
 <5592413B.6090508@lucaceresoli.net>
Message-ID: <20150630111335.47cbacba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Tue, 30 Jun 2015 09:11:55 +0200, Luca Ceresoli wrote:

> >> +The following defconfigs are available:
> >> + - olimex_a20_olinuxino_micro_defconfig
> >> +   for the A20-OLinuXino-MICRO board using mainline kernel and U-Boot
> >> + - olimex_a20_olinuxino_lime_defconfig
> >> +   for the A20-OLinuXino-LIME board using mainline kernel and U-Boot
> >> + - olimex_a20_olinuxino_lime_mali_defconfig
> >> +   for the A20-OLinuXino-LIME board using legacy linux-sunxi kernel and U-Boot
> >>
> >
> > The reference to U-Boot seems useless.
> 
> You're right. Will fix and resend, thanks.

If that's the only fix, no need to resend, I'll fixup when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
