From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Jul 2017 11:45:37 +0200
Subject: [Buildroot] [PATCH] package/rpi-firmware: install missing
	library
In-Reply-To: <20170715090831.1ed20473@windsurf>
References: <20170714220936.25212-1-yann.morin.1998@free.fr>
 <20170715090831.1ed20473@windsurf>
Message-ID: <20170715094537.GA3095@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-15 09:08 +0200, Thomas Petazzoni spake thusly:
> On Sat, 15 Jul 2017 00:09:36 +0200, Yann E. MORIN wrote:
> > The vcdbg utility is linked to a few libraries, which so far were all
> > provided by the rpi-userland package.
> > 
> > But a not-so-recent bump of rpi-firmware pulled in a vcdbg that is
> > linked to an additional library, which is not privided by rpi-userland,
> > so we must install it.
> 
> Could you qualify "not-so-recent" bump ? It's just to know if this is
> applicable to our LTS release.

The library was added in September 2016, and we bumped since then, so
yes, the fix applies to both the LTS branch and the maintenance branch
as well.

Regards,
Yann E. MORIN.

> Thanks!
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
