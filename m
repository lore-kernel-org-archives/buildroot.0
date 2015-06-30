From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 30 Jun 2015 09:11:55 +0200
Subject: [Buildroot] [PATCH 4/4] configs/olimex_a20_olinuxino_micro: new
	board
In-Reply-To: <CAB0FRssX3DheAt5K6GHq-jHr7=8FFw6SOirT59v5EcikjEDcZA@mail.gmail.com>
References: <1435615523-21039-1-git-send-email-luca@lucaceresoli.net>	<1435615523-21039-4-git-send-email-luca@lucaceresoli.net>
 <CAB0FRssX3DheAt5K6GHq-jHr7=8FFw6SOirT59v5EcikjEDcZA@mail.gmail.com>
Message-ID: <5592413B.6090508@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois,

Fran?ois Perrad wrote:
> 2015-06-30 0:05 GMT+02:00 Luca Ceresoli <luca@lucaceresoli.net>:
>> Add a defconfig for the Olimex A20-OLinuXino-Micro board, reusing most
>> of the A20-OLinuXino-Lime files.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>   board/olimex/a20_olinuxino/readme.txt        | 31 +++++++++++++------
>>   configs/olimex_a20_olinuxino_micro_defconfig | 46 ++++++++++++++++++++++++++++
>>   2 files changed, 67 insertions(+), 10 deletions(-)
>>   create mode 100644 configs/olimex_a20_olinuxino_micro_defconfig
>>
>> diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
>> index 6b8391484b92..101adcf6abbd 100644
>> --- a/board/olimex/a20_olinuxino/readme.txt
>> +++ b/board/olimex/a20_olinuxino/readme.txt
>> @@ -1,10 +1,22 @@
>> -A20-OLinuXino-LIME
>> +A20-OLinuXino-LIME and A20-OLinuXino-MICRO
>>
>>   Intro
>>   =====
>>
>> -This is a open hardware board,
>> -see https://www.olimex.com/Products/OLinuXino/open-source-hardware
>> +These are open hardware boards, both based an the AllWinners A20 SoC.
>> +
>> +for more details about the boards see the following pages:
>> + - https://www.olimex.com/Products/OLinuXino/open-source-hardware
>> + - https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-MICRO/
>> + - https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME/
>> +
>> +The following defconfigs are available:
>> + - olimex_a20_olinuxino_micro_defconfig
>> +   for the A20-OLinuXino-MICRO board using mainline kernel and U-Boot
>> + - olimex_a20_olinuxino_lime_defconfig
>> +   for the A20-OLinuXino-LIME board using mainline kernel and U-Boot
>> + - olimex_a20_olinuxino_lime_mali_defconfig
>> +   for the A20-OLinuXino-LIME board using legacy linux-sunxi kernel and U-Boot
>>
>
> The reference to U-Boot seems useless.

You're right. Will fix and resend, thanks.

-- 
Luca
