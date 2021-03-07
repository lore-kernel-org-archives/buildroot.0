From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Mar 2021 21:53:44 +0100
Subject: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: fix checksum of
 license
In-Reply-To: <20210307204407.GZ2275@scaer>
References: <86d5deb9-b0d8-b655-21b6-0f1f3a3f1f96@grenoble.cnrs.fr>
 <20210307204407.GZ2275@scaer>
Message-ID: <20210307205344.GC2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Edgar, All,

On 2021-03-07 21:44 +0100, Yann E. MORIN spake thusly:
> On 2021-03-07 20:45 +0100, Edgar Bonet spake thusly:
> > Commit ca1604388a86d73c548c6e65eadd13f424685838 updated the checksum of
> > the tarball, but failed to update the one of main.c, which serves as a
> > license file.
> > 
> > Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> Applied to next, thanks.

Not a big deal, but in fact, the real commit that forgot to update the
hash was commit f379e75dcd80 (boot/at91bootstrap3: bump to version
3.9.2), not ca1604388a86 as you mention.

But I forgot to amend the commit before pushing, damn me...

Regards,
Yann E. MORIN.

> > ---
> >  boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
> > index 6671a4ac70..6b6257b0ab 100644
> > --- a/boot/at91bootstrap3/at91bootstrap3.hash
> > +++ b/boot/at91bootstrap3/at91bootstrap3.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> >  sha256  dd6a3c57c1c84fc3b18187bee3d139146a0e032dd1d8edea7b242730e0bc4fe1  at91bootstrap3-v3.9.3.tar.gz
> > -sha256  732b2a55b5905031d8ae420136ffb5f8889214865784386bf754cffab8d2bc6e  main.c
> > +sha256  fd7a1ce5719bb7abf5e289da2e0ea8c933af3ba0f6ad03dbdbd2b7f54a77498a  main.c
> > -- 
> > 2.25.1
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
