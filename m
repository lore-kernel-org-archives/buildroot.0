From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Wed, 16 Sep 2020 06:30:40 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx:
 custom padding
In-Reply-To: <20200915131902.GA316402@p1g2>
References: <20200910141843.3030855-1-pieter.degendt@basalte.be>
 <20200915130414.3286332-1-pieter.degendt@basalte.be>,
 <20200915131902.GA316402@p1g2>
Message-ID: <VE1PR04MB740571AF5827D0B59B923344A7210@VE1PR04MB7405.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pieter, Gary and all,

>
>Hi Pieter,
>
>On Tue, Sep 15, 2020 at 03:04:14PM +0200, Pieter De Gendt wrote:
>> From: Tibault Damman <tibault.damman@basalte.be>
>>
>> Some derivatives (such as Variscite imx8mm) expect the (LP)DDR4
>> training data to be padded to a different length.
>>
>> eg: https://github.com/varigit/uboot-imx/commit/5f8d814f
>>
>> This patch makes the padding length configurable.
>>
>> Signed-off-by: Tibault Damman <tibault.damman@basalte.be>
>> Signed-off-by: Pieter De Gendt <pieter.degendt@basalte.be>
>>
>> ---
>> Changes v1 -> v2:
>>   - improved description
>>   - renamed variables to match U-Boot (suggested by Gary Bisson)
>>
>> Signed-off-by: Pieter De Gendt <pieter.degendt@basalte.be>
>
>Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Tested-by: Stephane Viau <stephane.viau@oss.nxp.com>
[Stephane: tested on i.MX8MM, i.MX8MN(ddr4) and i.MX8MQ EVK]
  
>
>Thanks for your contribution!
>
>Regards,
>Gary
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
>
