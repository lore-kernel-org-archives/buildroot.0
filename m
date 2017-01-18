From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Jan 2017 17:53:18 +0100
Subject: [Buildroot] [PATCH] barebox: bump to version 2017.01.0
In-Reply-To: <20170118162639.zecoy2bitgssoyvd@tarshish>
References: <20170118162320.6343-1-fabio.porcedda@gmail.com>
 <20170118162639.zecoy2bitgssoyvd@tarshish>
Message-ID: <CAHkwnC9D4+FfZ9=XGDg7t1_oRwi0yygiZJ_tEjx1-a=3PonOFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-01-18 17:26 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Fabio,
>
> On Wed, Jan 18, 2017 at 05:23:20PM +0100, Fabio Porcedda wrote:
>> diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
>> index adcd4e0b9..c369c9d49 100644
>> --- a/boot/barebox/barebox.hash
>> +++ b/boot/barebox/barebox.hash
>> @@ -1,5 +1,5 @@
>> -# http://www.barebox.org/download/barebox-2016.08.0.tar.bz2.md5
>> -md5 66b8f79d337fa4a7bb8744b1a7867474 barebox-2016.08.0.tar.bz2
>> +# http://www.barebox.org/download/barebox-2017.01.0.tar.bz2.md5
>> +md5 d2933437885497b09d69d6e6f4beeffc  barebox-2017.01.0.tar.bz2
>>
>>  # Locally calculated
>> -sha256 610d3422137f0e6e9a72f51caad17d1b2c46314ee03b2ae35799a1c5425478ab barebox-2016.08.0.tar.bz2
>> +sha256 ca4cc06bdc7183e3fcb4bed300f1e820df1e022a7b86fdcf64205ddb6a103567  barebox-2017.01.0.tar.bz
>
> Something is missing here. Have you build tested this patch?

Thanks for finding the type, i will send an updated patch.

Yes i have tested this patch but that typo doesn't produce an error
because the md5 line is enough.

Best regards
-- 
Fabio Porcedda
