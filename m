From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu, 15 Jul 2021 23:11:00 +0200
Subject: [Buildroot] [PATCH 2/2] configs/stm32mp157c_dk2: bump Linux and
 U-Boot versions
In-Reply-To: <YPCjU4bh/cgjZUy9@curiosity>
References: <20210715204746.22089-1-texier.pj2@gmail.com>
 <20210715204746.22089-2-texier.pj2@gmail.com> <YPCjU4bh/cgjZUy9@curiosity>
Message-ID: <f835ed39-ea25-0f33-ca6d-abbfe46aef90@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Sergey,

Le 15/07/2021 ? 23:06, Sergey Matyukevich a ?crit?:
> Hi all,
> 
>> Needed to keep both stm32mp157c_dk1 and stm32mp157c_dk2
>> aligned.
>>
>> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
>> ---
>>   configs/stm32mp157c_dk2_defconfig | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
>> index a4bff897e5..45205982d7 100644
>> --- a/configs/stm32mp157c_dk2_defconfig
>> +++ b/configs/stm32mp157c_dk2_defconfig
>> @@ -1,11 +1,11 @@
>>   BR2_arm=y
>>   BR2_cortex_a7=y
>> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
>>   BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
>>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
>>   BR2_LINUX_KERNEL=y
>>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.10"
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
>>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
>>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> @@ -25,7 +25,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
>>   BR2_TARGET_UBOOT=y
>>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
>>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>>   BR2_TARGET_UBOOT_FORMAT_STM32=y
> 
> Reviewed-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> Thanks !

Thanks for the review !

-- 
Pierre-Jean Texier
