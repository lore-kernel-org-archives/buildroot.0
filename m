From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 31 Jul 2010 01:58:49 -0300
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <AANLkTinLPGGFwAJacsR4bhvBCDhCXL3mcf8c9gg=Wum=@mail.gmail.com>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
	<201007220352.37255.PeterHuewe@gmx.de>
	<AANLkTikKS2AppP8zpPudDFbKvchDZvlpfQeTb-TKKvT2@mail.gmail.com>
	<201007220457.24834.PeterHuewe@gmx.de>
	<20100722141715.7bbc4963@surf> <20100722171035.0e656a6c@surf>
	<AANLkTinLPGGFwAJacsR4bhvBCDhCXL3mcf8c9gg=Wum=@mail.gmail.com>
Message-ID: <AANLkTino=QGCMOmBvKw8aZf+vrjL6PW2GcYsH2aZJ3zm@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2010/7/30 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> Hi all,
>
>
> FYI: Atmel are eol'ing the AVR32AP7000 device. It is currently "Not
> recommended for new design" [1].

They have said in forums and other communications that they would EOL
because it reached the middle of it's expected life time. They still
produce them and would continue to do so for sometime.

> So...I guess AVR32 Linux is kind of a dead end now... or use uClinux
> on AVR32 UC3 devices...

But that's not an option for existing products that needs support. For
new development, people would probably look for arms or mips. We are
in the process of migrating to an ARM device from Samsung, but still
we need to be able to support the hardware that is out there. The next
batch will be our last with AP7000 but warranties, support, etc still
goes on.

Kind Regards,
    Thiago A. Correa
