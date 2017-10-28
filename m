From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Oct 2017 15:22:10 +0200
Subject: [Buildroot] [PATCH v2] package/glibc: switch to using the
	maintenance branch
In-Reply-To: <20171028151814.2c1b716e@windsurf>
References: <20171024143033.15102-1-romain.naour@gmail.com>
 <20171028095538.GA3280@scaer>
 <17ee01ce-9b5b-6c85-ffcc-5ef7b6d60f11@gmail.com>
 <20171028151814.2c1b716e@windsurf>
Message-ID: <20171028132210.GC3280@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain, All,

On 2017-10-28 15:18 +0200, Thomas Petazzoni spake thusly:
> On Sat, 28 Oct 2017 12:58:18 +0200, Romain Naour wrote:
> > > I would also add something like:
> > > 
> > >     Before bumping the version, first verify that the sha1 really
> > >     exists on the official git tree.  
> > 
> > You meant "the sha1 really exists on the git mirror tree" I guess :)
> 
> No, I think Yann really meant "in the official tree". The idea is that
> we shouldn't use a git hash from a "random" github mirror if this git
> hash doesn't exist in the official Git repository of the project.

Exactly, yes.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
