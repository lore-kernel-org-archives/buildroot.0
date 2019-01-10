From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 10 Jan 2019 22:27:31 +0100
Subject: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: bump
 version
In-Reply-To: <20190110221615.6dc304bf@windsurf>
References: <20190110203744.2848-1-giulio.benetti@micronovasrl.com>
 <20190110221615.6dc304bf@windsurf>
Message-ID: <59086ec6-2fb3-0bf1-de67-3c9fd269a45d@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 10/01/2019 22:16, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Thu, 10 Jan 2019 21:37:44 +0100, Giulio Benetti wrote:
>> For 4.20 support.
>>
>> git shortlog --invert-grep --grep travis --no-merges 143ff2b17de63ce931c4f758771969e75c09a4c7..
>> Roman Stratiienko (1):
>>        mali: support building against 4.20
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk    | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
>> index c7f294cbf4..a77ee91f7e 100644
>> --- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
>> +++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -SUNXI_MALI_MAINLINE_DRIVER_VERSION = 143ff2b17de63ce931c4f758771969e75c09a4c7
>> +SUNXI_MALI_MAINLINE_DRIVER_VERSION = e28c274f85c65ebec82cdf0f8d021895e105d917
> 
> How can this work without updating the .hash file ?

It won't, you're right.
I'm going to send v2 patch with hash calculated.

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
