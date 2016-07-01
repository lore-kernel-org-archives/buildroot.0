From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jul 2016 19:56:56 +0200
Subject: [Buildroot] [PATCH 3/4] linux-headers: rename _AS_KERNEL to
 _FROM_KERNEL
In-Reply-To: <CAJJ6jxsbNd-wA8pe+NE=Fw3-=RNzrivBEq5mKeumR3Ayd_Pw9Q@mail.gmail.com>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1461099155-30702-4-git-send-email-vivien.didelot@savoirfairelinux.com>
 <20160701143414.GA17666@free.fr>
 <CAJJ6jxsbNd-wA8pe+NE=Fw3-=RNzrivBEq5mKeumR3Ayd_Pw9Q@mail.gmail.com>
Message-ID: <20160701175656.GD17666@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2016-07-01 10:51 -0700, Steve Calfee spake thusly:
> On Fri, Jul 1, 2016 at 7:34 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Vivien, All,
> >
> <snip>
> 
> >   - however, it's been part of a release now, and handling legacy for a
> >     symbol in a choice is not easy;
> 
> I think breaking user's configurations by changing config names is
> very serious and should be done for a very good reason, not just to
> get a slightly clearer name.

That's why we did not rename the option.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
