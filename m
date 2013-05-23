From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 May 2013 19:42:27 +0200
Subject: [Buildroot] [PATCH 2/5] tvheadend: needs threads
In-Reply-To: <CAKcgs2zzTjEqhz33n2foQGGOLoR4ymsp45brszkYNcu3Gxcz+g@mail.gmail.com>
References: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
 <1369268647-13128-2-git-send-email-gilles.talis@gmail.com>
 <20130523065406.GC3373@free.fr>
 <CAKcgs2zzTjEqhz33n2foQGGOLoR4ymsp45brszkYNcu3Gxcz+g@mail.gmail.com>
Message-ID: <20130523174227.GB3250@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2013-05-23 07:44 -0700, Gilles Talis spake thusly:
> 2013/5/22 Yann E. MORIN <yann.morin.1998@free.fr>:
> > Gilles, All,
> >
> > Is it because tvheadend selects dvb-apps that it requires threads, or
> > does it itself require threads?
> >
> It is tvheadend that needs threads.

OK.

> It is not dvb-apps that requires
> threads, but dvb-apps utils.

Yep, I meant dvb-apps utils.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
