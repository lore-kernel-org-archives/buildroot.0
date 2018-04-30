From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Apr 2018 18:41:51 +0200
Subject: [Buildroot] [PATCH 0/3] core/pkg-infra: declare target variant
 before host variant
In-Reply-To: <20180430174437.7e04de37@windsurf>
References: <cover.1525004110.git.yann.morin.1998@free.fr>
 <20180430174437.7e04de37@windsurf>
Message-ID: <20180430164151.GA2470@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-30 17:44 +0200, Thomas Petazzoni spake thusly:
> On Sun, 29 Apr 2018 14:15:19 +0200, Yann E. MORIN wrote:
> > Thomas Petazzoni (3):
> >       package: declare target variant before host variant
> >       package/qemu: declare target variant before host variant
> >       package/pkg-generic: add check that target variant is defined before host variant
> 
> Series applied. Thanks for having pushed this stuff all the way to the
> point where it got merged!

And it's only the beginning of it. Muahaha! ;-)
Search for 'yem/oot*' there: https://git.buildroot.org/~ymorin/git/buildroot/refs/heads

Thanks for the initial work, though ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
