From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2015 23:35:49 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/nodejs: add version 4.1.2
In-Reply-To: <1445290295.12260.2.camel@embedded.rocks>
References: <cover.1445277033.git.yann.morin.1998@free.fr>
 <91f96e06dbe44ab711b1bb688892c31886026b59.1445277033.git.yann.morin.1998@free.fr>
 <1445290295.12260.2.camel@embedded.rocks>
Message-ID: <20151019213549.GI3651@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-10-19 23:31 +0200, J?rg Krause spake thusly:
> On Mo, 2015-10-19 at 19:51 +0200, Yann E. MORIN wrote:
> > We add a new version, because it is not API-compatible with the
> > pervious
> > versions.
> previous? :-)

That was vicious. ;-)
Fixed, thanks.

> > Also, 4.1.2 requires gcc >= 4.8.
> I tried with a gcc 4.8 toolchain and it compiles without any errors.

Yes, I tries with gcc-4.7 and it breaks, while it builds with gcc-4.8.
Thanks for the confirmation. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
