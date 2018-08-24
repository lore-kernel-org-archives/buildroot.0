From: Brad Love <brad@nextdimension.cc>
Date: Fri, 24 Aug 2018 08:57:22 -0500
Subject: [Buildroot] [PATCH 1/2] i2c-tools: include LGPL-2.1+ license
 for libi2c
In-Reply-To: <877ekgv1ag.fsf@tkos.co.il>
References: <1535055605-8974-1-git-send-email-brad@nextdimension.cc>
 <1535055605-8974-2-git-send-email-brad@nextdimension.cc>
 <877ekgv1ag.fsf@tkos.co.il>
Message-ID: <d52bd89b-4bd8-b6d3-5fe7-57f466592671@nextdimension.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,


On 2018-08-23 23:25, Baruch Siach wrote:
> Hi Brad,
>
> Brad Love writes:
>> Extend i2c-tools SPDX identifiers to include the library license.
>>
>> The ic2-tools readme states:
>>
>> LICENSE
>>
>> Check the documentation of individual tools for licensing information.
>> The library is released under the LGPL version 2.1 or later, while most
>> tools are released under the GPL version 2 or later, but there are a few
>> exceptions.
>>
>>
>> Signed-off-by: Brad Love <brad@nextdimension.cc>
>> ---
>>  package/i2c-tools/i2c-tools.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
>> index db26647..a346698 100644
>> --- a/package/i2c-tools/i2c-tools.mk
>> +++ b/package/i2c-tools/i2c-tools.mk
>> @@ -7,7 +7,7 @@
>>  I2C_TOOLS_VERSION = 4.0
>>  I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
>>  I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
>> -I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus)
>> +I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (libi2c)
>>  I2C_TOOLS_LICENSE_FILES = COPYING
> Please add COPYING.LGPL here as well. And while you are at it, I think
> adding README would also be good.

Done, v3 has been submitted. Apologies for the omission.

Cheers,

Brad


>>  I2C_TOOLS_MAKE_OPTS = EXTRA=eeprog
> baruch
>
