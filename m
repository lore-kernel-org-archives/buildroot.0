From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 31 Jul 2010 02:50:05 +0200
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <20100722171035.0e656a6c@surf>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
	<201007220352.37255.PeterHuewe@gmx.de>
	<AANLkTikKS2AppP8zpPudDFbKvchDZvlpfQeTb-TKKvT2@mail.gmail.com>
	<201007220457.24834.PeterHuewe@gmx.de>
	<20100722141715.7bbc4963@surf> <20100722171035.0e656a6c@surf>
Message-ID: <AANLkTinLPGGFwAJacsR4bhvBCDhCXL3mcf8c9gg=Wum=@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On 22 July 2010 17:10, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> BTW, if there are people working at Atmel on this list, it'd be great
> if Atmel could put online updated version of gcc, binutils and gdb for
> the AVR32 architecture. Currently, we are stuck at gcc 4.2.x and
> binutils 2.18.
>
> On the Atmel website, it is possible to download a single zip file that
> contains tarballs for gcc, gdb, binutils and newlib. Having that in a
> single zip file is very unpractical for build systems like Buildroot.
> Moreover, having to register on the website (name, address, phone
> number and all the stuff) is even more inconvenient.
>
> Would it be possible to just drop the individual tarballs at some
> public location, with no registration required ? Or even better, get
> the AVR32 support merged in the respective upstream projects :-)

FYI: Atmel are eol'ing the AVR32AP7000 device. It is currently "Not
recommended for new design" [1].

So...I guess AVR32 Linux is kind of a dead end now... or use uClinux
on AVR32 UC3 devices...

Best regards,
Bj?rn Forsman

[1]: http://www.atmel.com/dyn/products/product_card.asp?part_id=3903
