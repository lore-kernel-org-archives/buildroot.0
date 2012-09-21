From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 21 Sep 2012 20:53:08 +0200
Subject: [Buildroot] [PATCH 13/13] microperl: mark as DEPRECATED
In-Reply-To: <20120920222203.2c608fcf@skate>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-13-git-send-email-francois.perrad@gadz.org>
 <20120920222203.2c608fcf@skate>
Message-ID: <CAB0FRsuHy1wibu0X=8q168hKbhO-Rv2FMgewY1O1LN3HAfV4Jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/9/20 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Sat,  8 Sep 2012 14:28:45 +0200, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/microperl/Config.in |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/microperl/Config.in b/package/microperl/Config.in
>> index 66bbedd..19d104a 100644
>> --- a/package/microperl/Config.in
>> +++ b/package/microperl/Config.in
>> @@ -2,6 +2,7 @@ config BR2_PACKAGE_MICROPERL
>>       bool "microperl"
>>       # needs fork()
>>       depends on BR2_USE_MMU
>> +     depends on BR2_DEPRECATED
>
> If microperl is deprecated, is it really useful to have patches 7, 8,
> 9, 10, 11 and 12 that are making improvements to it, and updating it to
> a more recent version?
>

Thomas,

I added this commit after your request in
http://patchwork.ozlabs.org/patch/180227/ (Aug. 27, 2012, 9:54 p.m.)

Fran?ois


> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
