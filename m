From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Tue, 5 Jan 2021 15:10:39 +0000
Subject: [Buildroot] [PATCH 1/8] package/freescale-imx/firmware-imx:
 bump version to 8.10
In-Reply-To: <X/RMkp0aXytk1R+Q@p1g2>
References: <20210104173820.6720-1-stephane.viau@oss.nxp.com>
 <20210104173820.6720-2-stephane.viau@oss.nxp.com>,<X/RMkp0aXytk1R+Q@p1g2>
Message-ID: <PA4PR04MB79203A306EF20E68B5CB57D6A7D10@PA4PR04MB7920.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>Hi Stephane,

Hi Gary, 

Thank you for the review!

>
>On Mon, Jan 04, 2021 at 06:38:13PM +0100, Stephane Viau wrote:
>> This version is aligned with 5.4.70_2.3.0 NXP Linux BSP.
>
>I usually add a line providing the NXP terms version to explain the
>EULA/COPYING hash update:
>- EULA/COPYING: update to LA_OPT_NXP_Software_License v17
>(might not be necessary, more of a FYI)

You're right... let me send out a v2 to fix this.

BR, 
Stephane.
>
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>> ---
>>  package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
>>  package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
>> index 3230677d49..0a717d40f5 100644
>> --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
>> +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
>> @@ -1,4 +1,4 @@
>>  # Locally calculated
>> -sha256  a72f70fd2ecaa58800bb88ed672fddc322ab9843ee7777eb89b82016b0aa3614  firmware-imx-8.9.bin
>> -sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
>> -sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
>> +sha256  2b70f169d4065b2a7ac7a676afe24636128bd2dacc9f5230346758c3b146b2be  firmware-imx-8.10.bin
>> +sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
>> +sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
>> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
>> index 7d1f42f1d8..b33ffb7ee8 100644
>> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
>> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -FIRMWARE_IMX_VERSION = 8.9
>> +FIRMWARE_IMX_VERSION = 8.10
>>  FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
>>  FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
>
>Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
>Thanks,
>Gary
>
>
