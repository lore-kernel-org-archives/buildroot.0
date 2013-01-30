From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 19:47:42 +0100
Subject: [Buildroot] [PATCH 02/29] package/qemu: build for the target
	(i386 or x86_64 only)
In-Reply-To: <20130130092514.6cc28821@skate>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
 <f188c40e460742e03046b1c37cdfb739371e7241.1359498903.git.yann.morin.1998@free.fr>
 <20130130092514.6cc28821@skate>
Message-ID: <201301301947.43258.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 30 January 2013 Thomas Petazzoni wrote:
> On Tue, 29 Jan 2013 23:43:46 +0100, Yann E. MORIN wrote:
> > +# Note: although QEMU uses a ./configure script, it is not compatible with
> > +#       the traditional autotools options (eg. --target et al.), so we have
> > +#       to override the default provided by the autotools-package infra, and
> > +#       provide our own. Sigh... :-/
> 
> Then please do not use the autotools-package infrastructure for this
> package. It doesn't use autoconf, it doesn't automake, it is *NOT*
> autotools.

ACK. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
