From: Martin Bark <martin@barkynet.com>
Date: Thu, 15 Mar 2018 20:23:20 +0000
Subject: [Buildroot] [PATCH 1/4] package/rpi-firmware: bump version
In-Reply-To: <20180315202856.39b87c81@gmx.net>
References: <1521120291-15781-1-git-send-email-martin@barkynet.com>
 <20180315202856.39b87c81@gmx.net>
Message-ID: <CAFGQKxf0Lhz+4qyLj9gJHxNX_8uS98Ht5ENGUuksFc1d8nkabQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 15 March 2018 at 19:28, Peter Seiderer <ps.report@gmx.net> wrote:
> Hello Martin,
>
> On Thu, 15 Mar 2018 13:24:48 +0000, Martin Bark <martin@barkynet.com> wrote:
>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>> ---
>>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
>> index 833a7fb..0e09ff5 100644
>> --- a/package/rpi-firmware/rpi-firmware.hash
>> +++ b/package/rpi-firmware/rpi-firmware.hash
>> @@ -1,2 +1,2 @@
>>  # Locally computed
>> -sha256 0451e1a843bf02df81126a1625d9a15dfdf19dcb2f9e95b0613a63e59fd31ca8 rpi-firmware-2067241bc7cdf238fdeab7f5a3c22faa57dd5617.tar.gz
>> +sha256 8fe5ebe14cc900f67242cab0c1c9f8e29bd10369ccbdfc7d004c294a96bad975 rpi-firmware-086a8488de0f485e8879ac14ff505ff1d922eeed.tar.gz
>> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
>> index 22eaaa2..1ebdd96 100644
>> --- a/package/rpi-firmware/rpi-firmware.mk
>> +++ b/package/rpi-firmware/rpi-firmware.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -RPI_FIRMWARE_VERSION = 2067241bc7cdf238fdeab7f5a3c22faa57dd5617
>> +RPI_FIRMWARE_VERSION = 086a8488de0f485e8879ac14ff505ff1d922eeed
>
> This commit (and some more before) have a reference to kernel branch 4.14.x, this one
> with subject 'kernel: Bump to 4.14.26'...
>
> The last commit referencing kernel branch 4.9.x is b1a7f4aea6cbd380319c2849ecc5988f9a4dba70
> 'kernel: Bump to 4.9.80', for consistence your should bump the firmware version to this
> commit (or bump the kernel versions to the latest from the 4.14.x branch)...

Good point i missed that.  I'll resubmit my patches and update to the
4.14 kernel instead.

Thanks

Martin

>
> Regards,
> Peter
>
>>  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>>  RPI_FIRMWARE_LICENSE = BSD-3-Clause
>>  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
>
