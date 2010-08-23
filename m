From: Wu, Josh <Josh.wu@atmel.com>
Date: Mon, 23 Aug 2010 07:27:32 +0200
Subject: [Buildroot] [PATCH] Add Atme at91sam9m10ekes, l at91sam9m10g45ek,
	at91sam9g10ek, at91sam9rlek boards support.
Message-ID: <C83D7CE8356557448A893798C8F9931D0610679E@frimb01.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all

Since in the Buildroot there are many AT91 boards support are out of date. I add this patch to support AT91SAM9M10EKES, AT91SAM9M10G45EK and other old boards like 9G10EK, 9RLEK.

It seems in the next release Buildroot will change a lot in the board's structure. I hope 2010.08 can support the AT91 latest board.

Here is the patch to add at91sam9m10ekes,l at91sam9m10g45ek, at91sam9g10ek, at91sam9rlek boards support. I will also post another patch to add the board default configuration file.
