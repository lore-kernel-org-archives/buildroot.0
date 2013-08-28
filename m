From: Will Newton <will.newton@gmail.com>
Date: Wed, 28 Aug 2013 08:17:55 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20130828090812.43a7f849@skate>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate>
Message-ID: <CAFbHwiTxij5iGz2d2+Ua3L6nc4rbB97Fno+Vum=_4nunNER+qA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 28, 2013 at 8:08 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

Hi Thomas,

>>    aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/6c179dca4455e4cb651f9b6bce1b2604366431f4/
>
> {standard input}: Assembler messages:
> {standard input}:7522: Error: immediate value out of range 0 to 255 at operand 2 -- `movi v14.8b,-1'
>
> Seems like a deeply AArch64 problem, should be reported to the AArch64 people at Linaro.

That's a known issue that should be fixed in the most recent release.
