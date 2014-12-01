From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Dec 2014 19:16:54 +0100
Subject: [Buildroot] [PATCH] package/bdwgc: only enable on supported
 architectures
In-Reply-To: <20141201181354.GR2204@tarshish>
References: <1417457426-2621-1-git-send-email-yann.morin.1998@free.fr>
 <20141201181354.GR2204@tarshish>
Message-ID: <20141201181654.GB4150@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2014-12-01 20:13 +0200, Baruch Siach spake thusly:
> On Mon, Dec 01, 2014 at 07:10:26PM +0100, Yann E. MORIN wrote:
> > diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
> > index 9aa7c7d..277b6e4 100644
> > --- a/package/bdwgc/Config.in
> > +++ b/package/bdwgc/Config.in
> > @@ -1,5 +1,12 @@
> > +config BR2_PACKAGE_BDWGC_ARCH_SUPPORTS
> > +	default y
> > +	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_i386 \
> > +		|| BR2_mips || BR2_MIPSEL || BR2_powerpc || BR2_sh \
> 
> s/BR2_MIPSEL/BR2_mipsel/

Damned, I forgot to lowercase that one...

How easy it is to read just what one expects, not what is really
written... Cognitive bias? :-]

Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
