From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 25 Mar 2015 11:45:57 +0100
Subject: [Buildroot] [PATCH v7] package/sysdig: New package
In-Reply-To: <20150325104410.GY2825@tarshish>
References: <1427279458-19079-1-git-send-email-angelo.compagnucci@gmail.com>
 <20150325104410.GY2825@tarshish>
Message-ID: <CA+TH9Vm8Gd6KE7tyPBKBn5LujRquym3toMtV6cx0uD6OoE2R3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

2015-03-25 11:44 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Angelo,
>
> On Wed, Mar 25, 2015 at 11:30:58AM +0100, Angelo Compagnucci wrote:
>> Sysdig is open source, system-level exploration:
>> capture system state and activity from a running Linux
>> instance, then save, filter and analyze.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> [...]
>
>> diff --git a/package/Config.in b/package/Config.in
>> index e4ee95d..28526c0 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -95,6 +95,7 @@ endif
>>       source "package/strace/Config.in"
>>       source "package/stress/Config.in"
>>       source "package/sysprof/Config.in"
>> +     source "package/sysdig/Config.in"
>
> Please keep the list alphabetically ordered. sysdig should be above sysprof.

You are totally right, my fault ... Submitting a new patch in minutes.

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
