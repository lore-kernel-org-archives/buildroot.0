From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 24 Jan 2007 23:23:10 +0100
Subject: [Buildroot] [PATCH] Prepatory patch for Atmel AT91/AVR32 Target
	support
In-Reply-To: <1169591366.5361.3.camel@elrond.sweden.atmel.com>
References: <1169591366.5361.3.camel@elrond.sweden.atmel.com>
Message-ID: <20070124222310.GB28221@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 23, 2007 at 11:29:26PM +0100, Ulf Samuelsson wrote:
>Have target support allowing
>* Dataflashboot/at91bootstrap
>* U-Boot
>* Linux Kernel
>
>This is the first patch in a series to support 
>* AT91RM9200
>* AT91SAM9260
>* AT91SAM9261
>* AT91SAM9263
>* AT32AP700x
>
>It will rearrange the taarget/Config.in in Alphapbetical order and 
>create the target/device/Atmel directory with an empty Config.in
>
>Best Regards
>Ulf Samuelsson
>

>Author:	Ulf Samuelsson
>Date:	2007-01-23
>
>Log:
>Prepatory patch for new Atmel targets boards
>Rearrange in Alphabetical order

Merged. Thanks
