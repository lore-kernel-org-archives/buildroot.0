From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Nov 2019 21:26:37 +0100
Subject: [Buildroot] [PATCH 1/1] add pattern based copy for ATF as
 already used for u-boot. This add support for different platforms where the
 binaries have different extension
In-Reply-To: <20191112201712.GA17609@curiosity>
References: <1573221183-25905-1-git-send-email-michael.schenk@noser.com>
 <20191111085118.5ymswhzmvkpdkwit@bars>
 <DB7PR04MB500309181A711B70FEB5B58181740@DB7PR04MB5003.eurprd04.prod.outlook.com>
 <20191112201712.GA17609@curiosity>
Message-ID: <20191112212637.7c8721c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Nov 2019 23:17:12 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> > Hi,
> > 
> > recently I've starting to make a little playground for using STM32MP1 (https://github.com/schenkmi/buildroot-op-tee-stm32mp1) with OP-TEE build with Buildroot. The proposed change is for platforms like the STM32MP1 which add some special headers to the final binary and add a different file ending. In the STM32MP1 the ATF binaries are called *.stm32. A similar change already exist for U-BOOT and optee-os but was missing for ATF.  
> 
> Hi Michael,
> 
> Thanks for clarification. BTW, for some reason I don't see your patch
> in buildroot patchwork system. Though I am not sure if this is a
> problem for maintainers...

In fact, it seems like the initial e-mail from Michael didn't made it
to the list at all. At least, I don't see it in my local archives of
the mailing list.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
