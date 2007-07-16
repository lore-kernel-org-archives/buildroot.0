From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 16 Jul 2007 13:14:52 +0300
Subject: [Buildroot] RFC: Building mtd-20061022
In-Reply-To: <1184413844.4954.37.camel@elrond.sweden.atmel.com>
References: <1184413844.4954.37.camel@elrond.sweden.atmel.com>
Message-ID: <20070716131452.2df09304@newbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Jul 2007 13:50:44 +0200
Ulf Samuelsson wrote:

> The current default mtd does not support dataflash properly.
> The mtd from 20061022 does a better job but the current mtd.mk
> is incompatible with 20061022 since among other things
> the directory structure has changed.
> 
> This proposed patch will allow the user to select a new build
> script by adding the BR2_PACKAGE_MTD_EXPERIMENTAL config option
> and if set, then 20061022 will be used, if not set,
> then the original mtd build script will be used.
> 
> This will allow people to test the mtd before making
> it a standard part of buildroot.
> 
> Comments?
> 
> 

Ulf,

I will test on AT91RM9200 board with dataflash during this week and report results.

BR,
Ivan
