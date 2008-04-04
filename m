From: Jorge S. <jorgesolla@gmail.com>
Date: Fri, 4 Apr 2008 14:54:05 +0200
Subject: [Buildroot] Flash for AT91RM9200
In-Reply-To: <1207311272.1106.4.camel@localhost>
References: <039401c895a7$61f39304$85f0af0a@corp.atmel.com>
	<6090c5eb0804040452s11dc749m4fb3c1e44c341295@mail.gmail.com>
	<1207311272.1106.4.camel@localhost>
Message-ID: <6090c5eb0804040554w3d675e90q52c6bd8724925374@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hans:

Thanks for your urgent reply.

What do you think about a combo solution?

- SPI Dataflash for booting
- Some at least 128 MiB Flash for rootfs...

Any known problem on the AVR32 world with big nand flashes?

On Fri, Apr 4, 2008 at 2:14 PM, Hans-Christian Egtvedt <
hans-christian.egtvedt@atmel.com> wrote:

> On Fri, 2008-04-04 at 13:52 +0200, Jorge S. wrote:
>
> <cut need for only one large flash device>
>
> > Is it possible to boot from nand (or nor) flash on the AVR32 and the
> > AT91SAMxxxx series? if yes, can you please
> > provide part numbers for known working chips?.
> >
>
> AVR32 AP700X supports boot from NOR flash only, and is limited by a 64
> MB size of chip select 0 on the external bus interface.
>
> AFAIK Atmel NOR flashes, some ST NOR flashes and Spansion NOR flashes
> are supported. If you drop avr32 at atmel.com an email you will probably
> get a known to work list.
>
> I have seen board with AP7000 and 2 x 64 MB NOR flash working (-:
>
> --
> With kind regards,
> Hans-Christian Egtvedt, Applications Engineer
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080404/eb144719/attachment.htm 
