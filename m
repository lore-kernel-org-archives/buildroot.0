From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 27 Dec 2018 15:38:56 +0100
Subject: [Buildroot] [PATCH 2/9] package/freescale-imx/firmware-imx: Fix
 typos
In-Reply-To: <20181227100241.3c7c1113@windsurf>
References: <20181226223112.24456-1-nerv@dawncrow.de>
 <20181226223112.24456-2-nerv@dawncrow.de> <20181227100241.3c7c1113@windsurf>
Message-ID: <e874bfb8-fc5d-9ad4-f971-07fd97ad56b7@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.12.18 um 10:02 schrieb Thomas Petazzoni:
> Hello,
> 
> On Wed, 26 Dec 2018 23:31:05 +0100, Andr? Hentschel wrote:
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
>> ---
>>  package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
>> index 0a503d7a66..240985297c 100644
>> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
>> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
>> @@ -35,7 +35,7 @@ endef
>>  
>>  define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>>  	# Create padded versions of lpddr4_pmu_* and generate lpddr4_pmu_train_fw.bin.
>> -	# lpddr4_pmu_train_fw.bin isneeded when generating imx-boot-imx8mqevk-sd.bin
>> +	# lpddr4_pmu_train_fw.bin is needed when generating imx-boot-sd.bin
> 
> Ditto, isn't this imx8-boot-sd.bin ?
> 
> Best regards,
> 
> Thomas
> 

Hi,

Thanks for having a look!
You are right, I better should not introduce new typos...
