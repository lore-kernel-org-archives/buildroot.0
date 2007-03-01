From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 1 Mar 2007 16:58:08 +0100
Subject: [Buildroot] static libgcc_s
References: <004901c75bcc$356388c0$8c1d10ac@atmel.com>
	<4B278B357EBD634ABB3A5F9D2B63B9C40176A903@iu-mssg-mbx101.ads.iu.edu>
Message-ID: <007901c75c1a$6acb4540$8c1d10ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi Ulf,
> Yes: you are right I can compile U-Boot with NOSOFTFLOAT=yes with the "default" toolchain (i.e. the one with shared gcc enabled), but I cannot compile AT91 > bootstrap for that I have (following Eric's tip) a static-only toolchain that compiles bootstrap.

Can you pinpoint exactly what causes the static only toolchain to be needed?
I find it highly irritating to have to use this toolchain.


Best Regards
Ulf Samuelsson
