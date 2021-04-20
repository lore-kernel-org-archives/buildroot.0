From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 20 Apr 2021 10:17:06 +0200
Subject: [Buildroot] [PATCH 5/5] package/freescale-imx/imx-seco: bump to
 version 3.7.5
In-Reply-To: <AM0PR04MB69465595F74C28F963032EB3A7499@AM0PR04MB6946.eurprd04.prod.outlook.com>
References: <20210419071654.8148-1-sebastien.szymanski@armadeus.com>
 <20210419071654.8148-5-sebastien.szymanski@armadeus.com>
 <AM0PR04MB69465595F74C28F963032EB3A7499@AM0PR04MB6946.eurprd04.prod.outlook.com>
Message-ID: <e5a0479e-806e-fe86-bff3-eeb3e16578c5@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On 4/19/21 10:35 PM, Stephane Viau (OSS) wrote:
> Hi S?bastien, 
> 
>>
>> - Same version as NXP release 5.10.9_1.0.0
>>
>> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
>> ---
>> package/freescale-imx/imx-seco/imx-seco.hash | 2 +-
>> package/freescale-imx/imx-seco/imx-seco.mk   | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
>> index 2e111c64d7..378c24bc54 100644
>> --- a/package/freescale-imx/imx-seco/imx-seco.hash
>> +++ b/package/freescale-imx/imx-seco/imx-seco.hash
>> @@ -1,4 +1,4 @@
>> # Locally calculated
>> -sha256  2ed8177e48c8e33f742b3a642805be56a5ef56df78b1b29e10518552154da2bc  imx-seco-3.7.4.bin
>> +sha256  08cf25a4be6841ca7264a50b29c311b386eae1c02fced8a3b55fd04213acb4bc  imx-seco-3.7.5.bin
>> sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
>> sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
>> diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
>> index f7aaca7e4b..245c3e3311 100644
>> --- a/package/freescale-imx/imx-seco/imx-seco.mk
>> +++ b/package/freescale-imx/imx-seco/imx-seco.mk
>> @@ -4,7 +4,7 @@
>> #
>> ################################################################################
>>
>> -IMX_SECO_VERSION = 3.7.4
>> +IMX_SECO_VERSION = 3.7.5
> 
> It is usually safer to keep "imx-seco" in sync with "imx-sc-firmware" ; can you please bump the latter to v1.8.0 [1]?
> 
> [1] https://source.codeaurora.org/external/imx/meta-imx/tree/meta-bsp/recipes-bsp/imx-sc-firmware?h=gatesgarth-5.10.9-1.0.0

Sure. I'll send a v2.

Regards,

> 
> BR,
> Stephane.
> 
>> IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
>> IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
>>
>> --
>> 2.26.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 


-- 
S?bastien Szymanski, Armadeus Systems
Software engineer
