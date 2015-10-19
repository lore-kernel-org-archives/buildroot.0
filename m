From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2015 22:44:51 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/nodejs: add version 4.1.2
In-Reply-To: <20151019223759.104d9e82@free-electrons.com>
References: <cover.1445277033.git.yann.morin.1998@free.fr>
 <91f96e06dbe44ab711b1bb688892c31886026b59.1445277033.git.yann.morin.1998@free.fr>
 <20151019223038.6346f115@free-electrons.com>
 <20151019203543.GD3651@free.fr>
 <20151019223759.104d9e82@free-electrons.com>
Message-ID: <20151019204451.GE3651@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-19 22:37 +0200, Thomas Petazzoni spake thusly:
> On Mon, 19 Oct 2015 22:35:43 +0200, Yann E. MORIN wrote:
> > > ... and compare it to the patch. You're no longer importing bz2
> > > anywhere. Look at the same patch for 0.10 and 0.12, it is importing the
> > > bz2 module, just conditionally.
> > 
> > ACK, I'll fix that commit log.
> 
> So the bz2 import is no longer needed at all?

Nope. The build goes OK without it.

> > > We should maybe also upstream our nodejs patches... But that's a
> > > separate work.
> > I can take a shot at that...
> Would be good, but it is definitely not mandatory to get your patch
> accepted, of course.

Understood, but I'll try nonetheless (some of those patches are probably
easy to sneak in, liek the bz2 one).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
