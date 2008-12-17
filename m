From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 17 Dec 2008 07:50:03 +0100
Subject: [Buildroot] REQ: U-Boot Update on the Atmel Devices
 (at91sam9261)
In-Reply-To: <BAY124-W4592D0A695B7609A243BCDD2F50@phx.gbl>
References: <BAY124-W4592D0A695B7609A243BCDD2F50@phx.gbl>
Message-ID: <20081217075003.708d44dd@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Dec 2008 15:13:25 -0800
Quick X <quickx@hotmail.com> wrote:

> 
> I see "ninevolz" tried to update the Atmel U-Boot to the 1.3.x version almost a year ago but it was reverted by ulf (bad patch).  U-Boot 1.2.0 is pretty old (~2 years) and the newest U-Boot works for Atmel devices.
>  

U_BOOT_VERSION:=1.3.4 in target/u-boot/Makefile.in, seems fine.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
