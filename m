From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 1 Aug 2007 20:27:13 +0200
Subject: [Buildroot] touch menuconfig
In-Reply-To: <200708011939.43078.yann.morin.1998@anciens.enib.fr>
References: <016801c7d404$a2834ca0$dcc4af0a@atmel.com>
	<200708011939.43078.yann.morin.1998@anciens.enib.fr>
Message-ID: <200708012027.13742.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
Ulf,

On Wednesday 01 August 2007 19:39, Yann E. MORIN wrote:
> On Wednesday 01 August 2007 08:24, Ulf Samuelsson wrote:
> > I find it quite useful to have an empty file "menuconfig" in the top directory,
> > so I can get command completion when doing
> > $ make menuconfig
> > Any objections to adding this?
> I once had make-completion working in bash: it would scan the makefile in some
> manner and suggest matching options, files or rules depending on the pre-
> existing command line (was that in a Mandriva?). I'll try to dig that up and
> come back to you later this evening (GMT+2).

OK, it's still present in the bash-completion package of Mandriva 2007.0.
Debian has it as well. Both have good make completion.

So I don't see any reason to provide it by ourselves. But we can still point
to completion somewhere in docs/

I will try to submit a patch to document completion after dinner.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
