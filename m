From: Bernhard Petschina <bernhard.petschina@gmail.com>
Date: Fri, 2 Jul 2021 12:42:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/stm32flash: bump to version 0.6
In-Reply-To: <65661872-fda7-0554-7da2-c6fcf126b9d3@lucaceresoli.net>
References: <20210702091131.817804-1-bernhard.petschina@gmail.com>
 <65661872-fda7-0554-7da2-c6fcf126b9d3@lucaceresoli.net>
Message-ID: <14c4d2cf-b918-5cbe-083c-fed1ac0fb915@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Luca,

On 02.07.2021 12:31 Luca Ceresoli wrote:
> Hi Bernhard,
>
> On 02/07/21 11:11, Bernhard Petschina wrote:
>> Bump to latest official version.
>>
>> Signed-off-by: Bernhard Petschina <bernhard.petschina@gmail.com>
>> ---
>>   package/stm32flash/stm32flash.hash | 2 +-
>>   package/stm32flash/stm32flash.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
>> index 1b06a8f0f0..9bfb3f3be4 100644
>> --- a/package/stm32flash/stm32flash.hash
>> +++ b/package/stm32flash/stm32flash.hash
>> @@ -1,3 +1,3 @@
>>   # Locally computed:
>> -sha256  42b7d63f6016bd75911cbb87fe85fbc4f98adf3ceecfe6d91f7956b31d18095f  stm32flash-3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650-br1.tar.gz
>> +sha256  f140dcf9319b0a02c9137bc3824ab4b71719cb5470b3b78bbac7bcef8f299660  stm32flash-82f16f317185b6916e5f8b5697de58960f7e48a7-br1.tar.gz
>>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
>> diff --git a/package/stm32flash/stm32flash.mk b/package/stm32flash/stm32flash.mk
>> index a8ae9b01df..32ca5cf222 100644
>> --- a/package/stm32flash/stm32flash.mk
>> +++ b/package/stm32flash/stm32flash.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -STM32FLASH_VERSION = 3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650
>> +STM32FLASH_VERSION = 82f16f317185b6916e5f8b5697de58960f7e48a7
> Why not using a tag? 'v0.6' points to that exact SHA-1.

I looked at some other packages and previous commits and pretty much 
every package uses the commithash instead of a tag.
So I thought that was something lika an unwritten rule.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210702/3ba6a128/attachment.html>
