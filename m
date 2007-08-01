From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 1 Aug 2007 19:39:42 +0200
Subject: [Buildroot] touch menuconfig
In-Reply-To: <016801c7d404$a2834ca0$dcc4af0a@atmel.com>
References: <016801c7d404$a2834ca0$dcc4af0a@atmel.com>
Message-ID: <200708011939.43078.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
Ulf,

On Wednesday 01 August 2007 08:24, Ulf Samuelsson wrote:
> I find it quite useful to have an empty file "menuconfig" in the top directory,
> so I can get command completion when doing
> $ make menuconfig
> Any objections to adding this?

Yep. I'd prefer having a file somewhere in the tree (e.g. in docs/ or a new
tools/ directory) that contains some completion functions for somw shells
(at least bash and zsh come to mind) and that the users could source in theit
startup scripts.

Having a file which sole purpose is help completion would uselessly clutter
the directory, IMRHO.

I once had make-completion working in bash: it would scan the makefile in some
manner and suggest matching options, files or rules depending on the pre-
existing command line (was that in a Mandriva?). I'll try to dig that up and
come back to you later this evening (GMT+2).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
