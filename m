From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 25 Mar 2008 11:08:30 +0100
Subject: [Buildroot] build problems
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA76FC@mtsexchange.dc.multitech.prv>
Message-ID: <071001c88e62$e99bf330$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>I have had a similar problem, Steve. I wonder if any of the maintainers
> has tried running buildroot after a dirclean recently? Or cleared out
> the download directory to see if any package download interfaces have
> changed? I have been trying to get a successful buildroot process (for
> an AT91SAM9260EK) to complete for over 3 months now with no luck
> whatsoever. I ended up having to buy a Timesys linuxlink license in
> order to move forward.
> 
> Timothy Barr
> Hardware Development Engineer
> for Multi-Tech Systems, Inc.
> tbarr at multitech.com
> 

I build  at91sam9260dfc_defconfig regularily on my 
OpenSuSE 10.2 system and it seems to compile OK.
If you add more packages using menuconfig, there could be
problems of course.



Best Regards
Ulf Samuelsson 
