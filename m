From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jul 2013 15:09:42 +0200
Subject: [Buildroot] [pull request] Pull request for branch
 yem-no-arm-oabi
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <20130707150942.21590fe2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat,  6 Jul 2013 22:48:39 +0200, Yann E. MORIN wrote:

> This series finally gets rid of the legacy ARM OABI support.
> The series is split in four steps:
> 
>   - Patch 2 makes OABI un-selectable by entirely removing the
>     symbol from the Kconfig options
>   - Patches 3-5 remove all code called when OABI is set
>   - Patches 6-11 remove all code conditional on EABI, and make
>     it unconditional, since EABI is all we support now
>   - Patch 11 finally gets rid of the EABI symbol altogether.
> 
> As a bonus, patch 1 is a trivial indentation fix (use tabs, not spaces).
> 
> As discussed with Thomas on IRC, this will most probably come
> clashing with his own hard-float related series.

As we further discussed, I will take your patch series, put it at the
beginning of mine (with some necessary adjustments), will rebase my
work on top of it, and resend the whole thing.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
