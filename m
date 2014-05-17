From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 17:41:11 +0200
Subject: [Buildroot] [PATCH v7 20/31] xbmc: Allow compilation with uClibc
In-Reply-To: <oubk4bxabr.ln2@ID-313208.user.individual.net>
References: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
 <1400326806-16428-21-git-send-email-bernd.kuhls@t-online.de>
 <20140517161009.56006692@free-electrons.com>
 <ae9k4bxjmf.ln2@ID-313208.user.individual.net>
 <oubk4bxabr.ln2@ID-313208.user.individual.net>
Message-ID: <20140517154111.GB3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-17 17:31 +0200, Bernd Kuhls spake thusly:
> Bernd Kuhls <berndkuhls@hotmail.com> wrote in
> news:ae9k4bxjmf.ln2 at ID-313208.user.individual.net: 
> 
> > Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> > @public.gmane.org> wrote in
> > news:20140517161009.56006692-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8 at public.gman
> > e.org: 
> > 
> >>> +     depends on BR2_i386 || BR2_x86_64
> >> 
> >> Are you sure RasberryPi and other ARM users are happy with XBMC only
> >> being available on x86/x86-64 ?
> > 
> > of course not, but uclibc at arm compilation is broken upstream[1] and
> > fixed by the next patch[2]
> 
> thinking about it I squashed the arm patch into the uclibc patch.

Exactly what I was gonna suggest. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
