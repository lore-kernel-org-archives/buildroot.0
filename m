From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 1 Mar 2020 12:19:49 -0300
Subject: [Buildroot] [PATCH/next 1/3] package/openrc: bump to version
 0.42.1
In-Reply-To: <20200301131845.GI8743@scaer>
References: <20200229232829.4177324-1-aduskett@gmail.com>
 <CAJ4jsadHSGXq3T3gUUy7_nosa1RCX8YT9oVrMSoZ-1bHaK93RQ@mail.gmail.com>
 <20200301131845.GI8743@scaer>
Message-ID: <CAJ4jsaeVJfi4zmn=bgExJc_YV9ROt-LFo4mgACD1wKwmxW9-ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 1, 2020 at 10:18 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Carlos, Adam, All,
>
> On 2020-03-01 09:18 -0300, Carlos Santos spake thusly:
> > On Sat, Feb 29, 2020 at 8:28 PM <aduskett@gmail.com> wrote:
> > > From: Adam Duskett <Aduskett@gmail.com>
> > > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> [--SNIP--]
> > > -OPENRC_VERSION = 0.41.2
> > > +OPENRC_VERSION = 0.42.1
> [--SNIP--]
> > I'm working on this upgrade too and found that It's necessary to patch
> >  runlevels/Makefile to avoid creating agetty.tty[1-6] if
> > MKSYSVINIT=yes.
>
> Thanks for the feedback. I've marked that series as changes-requested in
> patchwork. Thanks!
>
> Regards,
> Yann E. MORIN.

I sent an updated series.

-- 
Carlos Santos <unixmania@gmail.com>
