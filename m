From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Aug 2013 12:30:54 +0200
Subject: [Buildroot] [PATCH] package/libbsd: further reduce the set of
 supported archs
In-Reply-To: <c7afbe678476690e9c2edb65e755f5a4@sysmic.org>
References: <1376951733-31803-1-git-send-email-yann.morin.1998@free.fr>
 <c7afbe678476690e9c2edb65e755f5a4@sysmic.org>
Message-ID: <20130820103054.GB3356@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2013-08-20 10:59 +0200, J?r?me Pouiller spake thusly:
> On 2013-08-20 00:35, Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >Support for a,out on ARM will be dropped in Linux 3.11 (and is already
> >missing in the -rc).
> >
> >m68k is marked BROKEN in Buildroot, so it is never ever tested.
> >
> >The x86 familly is the only one left with support for a.out, now.
> Hmm...  It looks like support for a.out may be removed using
> -D__NO_A_OUT_SUPPORT. Although, a.out.h is always included, even with
> this flag.
> 
> We may patch the code instead of disable architectures?

See the discussion with Thomas, starting with my analysis here:
    http://lists.busybox.net/pipermail/buildroot/2013-August/076659.html
and with Thomas' answer here:
    http://lists.busybox.net/pipermail/buildroot/2013-August/076661.html

> (In add, we may bump to 0.6.0)

Yes, maybe.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
