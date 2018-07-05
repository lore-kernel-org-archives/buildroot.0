From: Leon Anavi <leon.anavi@konsulko.com>
Date: Thu, 5 Jul 2018 11:00:45 +0300
Subject: [Buildroot] [PATCH]
 configs/olimex_a10_olinuxino_lime_defconfig: new board
In-Reply-To: <20180705073715.w7dmbjfhuh76ujtl@tarshish>
References: <1530775559-19415-1-git-send-email-leon.anavi@konsulko.com>
 <20180705073715.w7dmbjfhuh76ujtl@tarshish>
Message-ID: <519c9e52-7b21-1906-4d1b-25a642580a19@konsulko.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Thank you for the feedback. I have updated again my patch to keep the
alphabetical order in DEVELOPERS. Here is the new version of my patch
for A10-OLinuXino-LIME:
http://lists.busybox.net/pipermail/buildroot/2018-July/225277.html

Best regards,
Leon

On 5.07.2018 10:37, Baruch Siach wrote:
> Hi Leon,
>
> On Thu, Jul 05, 2018 at 10:25:59AM +0300, Leon Anavi wrote:
>> Add a defconfig for the Olimex A10-OLinuXino-LIME, reusing most
>> of the A20-OLinuXino-Lime and A13-OLinuXino files.
>>
>> The configurations for Olimex A10-OLinuXino-LIME feature:
>> - U-Boot 2018.03
>> - Mainline Linux kernel 4.14.26
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  DEVELOPERS                                  |  4 ++
>>  board/olimex/a10_olinuxino/boot.cmd         |  5 +++
>>  board/olimex/a10_olinuxino/genimage.cfg     | 17 +++++++++
>>  board/olimex/a10_olinuxino/post-build.sh    |  3 ++
>>  board/olimex/a10_olinuxino/readme.txt       | 57 +++++++++++++++++++++++++++++
>>  configs/olimex_a10_olinuxino_lime_defconfig | 48 ++++++++++++++++++++++++
>>  6 files changed, 134 insertions(+)
>>  create mode 100644 board/olimex/a10_olinuxino/boot.cmd
>>  create mode 100644 board/olimex/a10_olinuxino/genimage.cfg
>>  create mode 100755 board/olimex/a10_olinuxino/post-build.sh
>>  create mode 100644 board/olimex/a10_olinuxino/readme.txt
>>  create mode 100644 configs/olimex_a10_olinuxino_lime_defconfig
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 1fa0020..40baa7d 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -2146,3 +2146,7 @@ F:	package/tinc/
>>  
>>  N:	Pierre Ducroquet <pinaraf@pinaraf.info>
>>  F:	package/kf5/
>> +
>> +N:	Leon Anavi <leon.anavi@konsulko.com>
>> +F:	board/olimex/a10_olinuxino
>> +F:	configs/olimex_a10_olinuxino_lime_defconfig
> Please keep the alphabetic order of the list entries.
>
> I have just posted a patch moving Pierre's entry to its correct location.
>
> baruch
>

-- 
Leon Anavi
Software Engineer
konsulko.com
