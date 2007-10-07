From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 07 Oct 2007 20:04:26 +0200
Subject: [Buildroot] Several issues by a buildroot newbie...
In-Reply-To: <20071007163056.GJ20951@aon.at>
References: <4704186D.6070303@cavebear.com>
	<003d01c8063e$26edb230$b07ee255@atmel.com>
	<20071007163056.GJ20951@aon.at>
Message-ID: <1191780266.29084.23.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2007-10-07 klockan 18:30 +0200 skrev Bernhard Fischer:
> On Thu, Oct 04, 2007 at 06:14:47AM +0200, Ulf Samuelsson wrote:
> 
> >uClibc supports rindex if either of 
> >* UCLIBC_SUSV3_LEGACY or 
> >* UCLIBC_SYSV3_LEGACY MACROS 
> >is defined. 
> >Previously UCLIBC_SUSV3_LEGACY_MACROS was defined,
> >but Bernhard wants to get rid of all legacy stuff, and his idea to achieve
> 
> Ulf, go read docs/README and read the helptext of BR2_UCLIBC_CONFIG
> 
> Heck, do
> $ make help
> and read the helptext there (and document your make-targets while you're
> at it. Undocumented targets will be removed).
> 
> >this it is by intentionally breaking the build if you enable a package 
> >containing SUSV3_LEGACY stuff.
> 
> "Mum, XYZ is intentionally broken because it's not on per default".
> Yeah, right. Whatever.

I am well aware that you can create your own configuration.

It was on before, allowing packages to build.
You changed that to off.
You did that change to make sure something happen.
I cannot think of any other think, than you *INTENTIONALLY*
wanted the *default* operation of buildroot was to break all 
the build of all packages which contained LEGACY stuff.

The fact that it is possible to configure buildroot
to fix this, does not change the default operation.

If that was not your intention, then what ?

BR
Ulf
