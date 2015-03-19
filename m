From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 19 Mar 2015 18:08:25 +0100
Subject: [Buildroot] [PATCH v1 1/1] dvdrw-tools: delete explicit default
 for backend
In-Reply-To: <CA+TH9Vmtf8Ht6_kwb=ZLK0hucn6Hi9MY4q7vKBBcC_D4kNg3tQ@mail.gmail.com>
References: <1426782276-5069-1-git-send-email-skenton@ou.edu>
 <CA+TH9Vmtf8Ht6_kwb=ZLK0hucn6Hi9MY4q7vKBBcC_D4kNg3tQ@mail.gmail.com>
Message-ID: <CA+TH9Vm89FwRzDAhJ2nnbWe5_QehWvgVk_bbfbe9ZK85Ak8tCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-03-19 17:26 GMT+01:00 Angelo Compagnucci <angelo.compagnucci@gmail.com>:
> 2015-03-19 17:24 GMT+01:00 Steve Kenton <skenton@ou.edu>:
>> Signed-off-by: Steve Kenton <skenton@ou.edu>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Acked-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>> As suggested by Yann E. MORIN, just delete the default choice
>> to simplify things
>>
>>  package/dvdrw-tools/Config.in | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
>> index 6787b66..47835d8 100644
>> --- a/package/dvdrw-tools/Config.in
>> +++ b/package/dvdrw-tools/Config.in
>> @@ -35,7 +35,6 @@ config BR2_PACKAGE_DVDRW_TOOLS
>>  if BR2_PACKAGE_DVDRW_TOOLS
>>  choice
>>         prompt "Media Backend"
>> -       default BR2_PACKAGE_DVDRW_CDRKIT_BACKEND
>>         help
>>           Choose which media backend program to use.
>>
>> --
>> 2.1.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
