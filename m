From: Nicolas Ferre <nicolas.ferre@microchip.com>
Date: Fri, 6 Oct 2017 13:34:54 +0200
Subject: [Buildroot] [PATCH 1/2] configs/atmel: bump to linux4sam_5.7
In-Reply-To: <87lgkofts5.fsf@dell.be.48ers.dk>
References: <20171006100825.11378-1-nicolas.ferre@microchip.com>
 <87lgkofts5.fsf@dell.be.48ers.dk>
Message-ID: <46c1f6fc-5310-2faf-5c54-459c8d7ab4da@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/2017 at 12:35, Peter Korsgaard wrote:
>>>>>> "Nicolas" == Nicolas Ferre <nicolas.ferre@microchip.com> writes:
> 
>  > Bump at91sam9x5ek, atmel_sama5d2_xplained, atmel_sama5d3_xplained and
>  > atmel_sama5d4_xplained all variants to linux4sam_5.7. The 3 foundation
>  > components have their tags changed (AT91Bootstrap, U-Boot, Linux kernel).
> 
>  > Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Committed, thanks.
> 
>  > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.7"
> 
> 4.9.53 is out, so time to rebase ;)

Yeah, I thought 4.9.52 would be good at least for release announcement,
but... no, Crap! ;-)

Anyway, we'll see if I have better timing for linux4sam 5.8...

Thanks Peter, cheers,
-- 
Nicolas Ferre
