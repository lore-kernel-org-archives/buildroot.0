From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 24 Mar 2015 13:59:07 +0100
Subject: [Buildroot] [PATCH v3 3/3] boot/uboot: Add uboot-menuconfig and
 friends
In-Reply-To: <CAGm1_ksNKC75KFhE5m2YfKOv6Qb+6oHKTjVs-Rk7Aer8gf9CLg@mail.gmail.com>
References: <1423088981-13255-1-git-send-email-joerg.krause@embedded.rocks>
 <1423088981-13255-3-git-send-email-joerg.krause@embedded.rocks>
 <CAGm1_ktibDOCMvQqb4qAKGGM9SQvNnAX+Fbo0E-zq7ASW=NLyw@mail.gmail.com>
 <1427118197.10031.2.camel@embedded.rocks>
 <CAGm1_ksNKC75KFhE5m2YfKOv6Qb+6oHKTjVs-Rk7Aer8gf9CLg@mail.gmail.com>
Message-ID: <1427201947.31226.0.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mo, 2015-03-23 at 14:47 +0100, Yegor Yefremov wrote:
> On Mon, Mar 23, 2015 at 2:43 PM, J?rg Krause
> <joerg.krause@embedded.rocks> wrote:
> > Hi Yegor,
> >
> > On Mo, 2015-03-23 at 11:28 +0100, Yegor Yefremov wrote:
> >>
> >> could you please rework your patches to reflect the newest U-Boot
> >> Kconfig changes?
> >>
> >> kconfig: switch to single .config configuration
> >> (http://permalink.gmane.org/gmane.comp.boot-loaders.u-boot/212547)
> >
> > I hope these upstream changes make it easier to use the kconfig-package
> > infrastructure. I will submit the reworked patches if U-Boot 2015.04 is
> > released.
> 
> So do I.
> 
> What board are you working with?

A custom Freescale i.MX28 board.
