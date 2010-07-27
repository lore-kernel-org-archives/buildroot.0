From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Tue, 27 Jul 2010 22:39:45 +0200
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <20100722171035.0e656a6c@surf>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
	<20100722141715.7bbc4963@surf> <20100722171035.0e656a6c@surf>
Message-ID: <201007272239.45547.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Donnerstag 22 Juli 2010 17:10:35 schrieb Thomas Petazzoni:
> BTW, if there are people working at Atmel on this list, it'd be great...

Maybe CC or write to avr32 at atmel.com ?

> On the Atmel website, it is possible to download a single zip file that
> contains tarballs for gcc, gdb, binutils and newlib. Having that in a
> single zip file is very unpractical for build systems like Buildroot.
Yeah. But since I guess it is all gpl licenced software, wouldn't it be 
possible for the buildroot team to download the zip, repack it in single zips 
and host/mirror them on the buildroot mirrors? Or atleast the toolchain parts 
of the zip?

I know it's not a good option, but maybe it would ease the life of the 
buildroot devs (i.e. you and peter :P)

>Moreover, having to register on the website (name, address, phone
> number and all the stuff) is even more inconvenient.

I know that form, and even if it looks like it is mandatory, it is not, just 
click continue - even hotlinking would be possible.

Thanks,
Peter
