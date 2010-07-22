From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 22 Jul 2010 13:35:19 -0300
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <20100722171035.0e656a6c@surf>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
	<201007220352.37255.PeterHuewe@gmx.de>
	<AANLkTikKS2AppP8zpPudDFbKvchDZvlpfQeTb-TKKvT2@mail.gmail.com>
	<201007220457.24834.PeterHuewe@gmx.de>
	<20100722141715.7bbc4963@surf> <20100722171035.0e656a6c@surf>
Message-ID: <AANLkTimIMaR-ZNe459txa5EhNQJtSfqLcIgmFfiOHpK1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Jul 22, 2010 at 12:10 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> Ok, the patch that Gustavo has posted on Busybox at 3:50 PM today fixes
> the problem. So with my patch on the toolchain + Gustavo's patch on
> Busybox, I've been able to build an AVR32 toolchain, BusyBox, DirectFB
> and a sample DirectFB application. However, I don't have any hardware
> to test.

Thanks for the fast reply. I don't have any standard kit here, but I
can test on my own hardware.

> BTW, if there are people working at Atmel on this list, it'd be great
> if Atmel could put online updated version of gcc, binutils and gdb for
> the AVR32 architecture. Currently, we are stuck at gcc 4.2.x and
> binutils 2.18.
>

I don't work for Atmel, but would it be too bad to get the patches
back into buildroot? That's what OpenWRT is doing, and they have
updated to gcc 4.2.4 and binutils 2.19

I could make the changes and post a pull request.

Kind Regards,
    Thiago A. Correa
