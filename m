From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Wed, 21 Aug 2013 16:23:06 -0300
Subject: [Buildroot] [PATCH 2/2] toolchain-external: Add Sourcery
 CodeBench for Nios-II
In-Reply-To: <5214F192.50800@mind.be>
References: <1376999946-3314-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376999946-3314-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <52145B05.4080405@mind.be>
 <CAAEAJfBVeUKtYDwHF5=QXN6NVtPQm0c_u60qRDFbs7cUKKrbeg@mail.gmail.com>
 <5214F192.50800@mind.be>
Message-ID: <CAAEAJfBsymVg-zZuJuHFSXCmdhV6X2-VXk74YC8tvwbEQ8TVwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 21 August 2013 13:57, Arnout Vandecappelle <arnout@mind.be> wrote:
[...]
>
>  Kernel version is a bit more difficult: cat
> output/staging/usr/include/linux/version.h and convert the decimal version
> number to hex.
>

Right.

>  The supported architectures should also be mentioned, but that may be more
> difficult.
>

Mmm... what do you mean by supported architectures?
I'm not an expert Nios-II user (just started working on it) but there doesn't
seem to be any architectural variants.

>
>  We do usually keep an older version around as well, but I'm not really sure
> why. For the Sourcery toolchains it makes sense because they have different
> gcc versions, but the Linaro toolchains often only have bugfixes between one
> version and the next.
>

Speaking of toolchains. Any recomendations on how to *choose* a toolchain?

Should I safely use Sourcery?
Should I prefer Buildroot internal (when we add support for it)?
Which should be the rationale behind such decision? (aside from the
fact the buildroot toolchain allows to be tuned)

Thanks a lot for the help!
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
