From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Apr 2019 09:01:39 +0200
Subject: [Buildroot] [PATCH 1/1] infra/Makefile.in: Fix format_arg
 issues after bump gettext-tiny to c6dcdcd
In-Reply-To: <20190406212414.35qlmmpgklgt4ohy@vkochan-ThinkPad-T470p>
References: <20190404224700.1346-1-vadim4j@gmail.com>
 <20190404230503.ohxfkac6extrghuv@vkochan-ThinkPad-T470p>
 <20190406205356.GE2659@scaer> <20190406210516.GF2659@scaer>
 <20190406212414.35qlmmpgklgt4ohy@vkochan-ThinkPad-T470p>
Message-ID: <20190407070139.GH2659@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2019-04-07 00:24 +0300, Vadim Kochan spake thusly:
> On Sat, Apr 06, 2019 at 11:05:16PM +0200, Yann E. MORIN wrote:
> > On 2019-04-06 22:53 +0200, Yann E. MORIN spake thusly:
> > > On 2019-04-05 02:05 +0300, Vadim Kochan spake thusly:
> > > > On Fri, Apr 05, 2019 at 01:47:00AM +0300, Vadim Kochan wrote:
> > > > > After bump gettext-tiny to c6dcdcd there was change which enabled
> > > > > gettext's macroses by default in:
> > > > >     https://github.com/sabotage-linux/gettext-tiny/commit/58187329ad9f00eb8c39379e7ee0b608dd14bab8

Why not cary a revert of that commit, then?

Of course, a proper fix from upstream would be even better, but heck, at
least we could get back to a better situation for us...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
