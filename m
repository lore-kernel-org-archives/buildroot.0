From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 25 Mar 2015 11:32:57 +0100
Subject: [Buildroot] [PATCH v6] package/sysdig: New package
In-Reply-To: <20150325102526.GX2825@tarshish>
References: <1427278819-9444-1-git-send-email-angelo.compagnucci@gmail.com>
 <20150325102526.GX2825@tarshish>
Message-ID: <CA+TH9VmeSCTxPrk=Vw1Bfb7RU-XEJqRu2wGjJdyLy4XLQPNwtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach, Yegor Yefremov

2015-03-25 11:25 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Angelo,
>
> On Wed, Mar 25, 2015 at 11:20:19AM +0100, Angelo Compagnucci wrote:
>> Sysdig is open source, system-level exploration:
>> capture system state and activity from a running Linux
>> instance, then save, filter and analyze.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> [...]
>
>> diff --git a/package/Config.in b/package/Config.in
>> index e4ee95d..f3937e9 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -94,7 +94,8 @@ endif
>>       source "package/spidev_test/Config.in"
>>       source "package/strace/Config.in"
>>       source "package/stress/Config.in"
>> -     source "package/sysprof/Config.in"
>> +     source "package/sysprof/Config.in
>> +     source "package/sysdig/Config.in""
>
> Are you sure?

Never had such a speedy review, next time I will add nasty mistakes on
purpose! :)

I just sent a fixed patch.

Thank you for your effort!

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
