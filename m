From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri, 30 Nov 2007 17:24:05 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libosip2
In-Reply-To: <1196423486.4635.19.camel@elrond.atmel.sweden>
References: <20071130102837.4DBEBA6AB6@busybox.net>
	<474FF6C3.8020107@promwad.com>
	<1196423486.4635.19.camel@elrond.atmel.sweden>
Message-ID: <1196439845.475039252ddcd@imp.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Ulf Samuelsson <ulf@atmel.com>:

> Mistake, trying to add Doom as well so that slipped through.
> Doom fails to compile on ARM due to packing, but I might as well
> add it since is should compile on AVR32.
>

If you are interested in trying Doom, I have a working Buildroot makefile that
compiles successfully PrBoom (SDL Doom clone) on my ARM9 platform (i.MXL):
http://armadeus.svn.sourceforge.net/viewvc/armadeus/trunk/buildroot/package/prboom/

Regards,
Julien
