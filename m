From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Aug 2010 11:40:08 +0200
Subject: [Buildroot] [PATCH] Add Atme at91sam9m10ekes, l at91sam9m10g45ek,
 at91sam9g10ek, at91sam9rlek boards support.
In-Reply-To: <C83D7CE8356557448A893798C8F9931D0610679E@frimb01.corp.atmel.com>
References: <C83D7CE8356557448A893798C8F9931D0610679E@frimb01.corp.atmel.com>
Message-ID: <20100829114008.2a546ca4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Josh,

On Mon, 23 Aug 2010 07:27:32 +0200
"Wu, Josh" <Josh.wu@atmel.com> wrote:

> Since in the Buildroot there are many AT91 boards support are out of
> date. I add this patch to support AT91SAM9M10EKES, AT91SAM9M10G45EK
> and other old boards like 9G10EK, 9RLEK.
> 
> It seems in the next release Buildroot will change a lot in the
> board's structure. I hope 2010.08 can support the AT91 latest board.

I think it's too late for those patches to go in, but I'll let Peter
decide.

Whatever happens to these patches for 2010.08, I intend to upgrade the
support for Atmel boards as part of the work I'm doing on board
cleanup, as you've noticed. I will take these patches into account
while doing this cleanup effort.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
