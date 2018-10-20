From: Ranran <ranshalit@gmail.com>
Date: Sat, 20 Oct 2018 10:31:41 +0300
Subject: [Buildroot] Boot without busybox
In-Reply-To: <CAOf5uw=FT7GtzwsF+y6xPBPnFETyUo1JsvAax6RXNq-WHA4juQ@mail.gmail.com>
References: <CAJ2oMhJbBLv7eiJo=LNnmHSJms1SQZknD7_dTHM8UfE8xPoTxA@mail.gmail.com>
 <CAOf5uw=FT7GtzwsF+y6xPBPnFETyUo1JsvAax6RXNq-WHA4juQ@mail.gmail.com>
Message-ID: <CAJ2oMh+Xfew0Ecj_t1WcwEKDpcSNgiVcwN=4CyL6QrYQb6txuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 20, 2018 at 10:07 AM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi
>
> On Sat, Oct 20, 2018 at 9:05 AM Ranran <ranshalit@gmail.com> wrote:
> >
> > Hello,
> >
> > As part of Linux hardening we want to remove busybox from filesystem.
> > But I am not sure if system can boot without it.
> > I am quite sure that there are init files that depends on busybox.
>
> Why you just strip down busybox. Hardening of a minimal init script that come
> from busybox seems more reasonable then try to go to start linux init.
>
> >
> > Is it possible to boot without busybox or does it require a custom init ?
>
> Let's start that you require some process that it will be your init.
> It can be a very limited
> an custom one

Do you mean start minimizing busybox with "make busybox-menuconfig" ?
Should I choose busybox init or another init system (such as systemd) ?
When doing such process, is it easy to understand what the cause of
failure whenever something in init fails ?

Thanks,
Ran


>
> Michael
>
> >
> > Thank you,
> > ranran
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
> | Michael Nazzareno Trimarchi                     Amarula Solutions BV |
> | COO  -  Founder                                      Cruquiuskade 47 |
> | +31(0)851119172                                 Amsterdam 1018 AM NL |
> |                  [`as] http://www.amarulasolutions.com               |
