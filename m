From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 01 Aug 2007 21:45:33 +0200
Subject: [Buildroot] touch menuconfig
In-Reply-To: <200708012027.13742.yann.morin.1998@anciens.enib.fr>
References: <016801c7d404$a2834ca0$dcc4af0a@atmel.com>
	<200708011939.43078.yann.morin.1998@anciens.enib.fr>
	<200708012027.13742.yann.morin.1998@anciens.enib.fr>
Message-ID: <1185997533.10521.10.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-08-01 klockan 20:27 +0200 skrev Yann E. MORIN:
> All,
> Ulf,
> 
> On Wednesday 01 August 2007 19:39, Yann E. MORIN wrote:
> > On Wednesday 01 August 2007 08:24, Ulf Samuelsson wrote:
> > > I find it quite useful to have an empty file "menuconfig" in the top directory,
> > > so I can get command completion when doing
> > > $ make menuconfig
> > > Any objections to adding this?
> > I once had make-completion working in bash: it would scan the makefile in some
> > manner and suggest matching options, files or rules depending on the pre-
> > existing command line (was that in a Mandriva?). I'll try to dig that up and
> > come back to you later this evening (GMT+2).
> 
> OK, it's still present in the bash-completion package of Mandriva 2007.0.
> Debian has it as well. Both have good make completion.
> 
> So I don't see any reason to provide it by ourselves. But we can still point
> to completion somewhere in docs/
> 
> I will try to submit a patch to document completion after dinner.
> 

complete -W menuconfig make 

works for me and the rest is not so common that it
is a pain to write it out, but if it is easy to install,
why not!



> Regards,
> Yann E. MORIN.
> 
