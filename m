From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jan 2013 22:34:05 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: export BR2_CONFIG_FILE,
	pointing to our .config
In-Reply-To: <87d2x8x155.fsf@dell.be.48ers.dk>
References: <cover.1357595083.git.yann.morin.1998@free.fr>
 <50EC2CE0.2050106@mind.be> <87d2x8x155.fsf@dell.be.48ers.dk>
Message-ID: <201301132234.05394.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout, All,

On Sunday 13 January 2013 Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  >> I was not referring to our .mk files, but rather to the packages themselves.
>  >> I did a quick survey in 110+ packages, and:
>  >> - kconfig-based packages are not affected: kernel, uClibc, busybox, ct-ng
>  >> - packages using CONFIG_FILE:
>  >> - gdb:     gdb/sim/ppc/Makefile.in:CONFIG_FILE = @sim_config@
>  >> - xbmc:    xbmc/lib/freetype/builds/detect.mk:ifndef CONFIG_FILE
>  >> - no package uses DOT_CONFIG
>  >> - openbricks is using DOT_CONFIG, too
> 
>  Arnout>  But if you anyway change the name, BUILDROOT_CONFIG is better than
>  Arnout> the non-specific DOT_CONFIG.
> 
>  Arnout>  How long can we discuss about a name? :-)
> 
> Long ;)
> 
> I like BUILDROOT_CONFIG. It's unique and it's meaning is very
> obvious. Yann, care to rework the series to use BUILDROOT_CONFIG
> instead?

Yes, it's just a pull-request away! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
