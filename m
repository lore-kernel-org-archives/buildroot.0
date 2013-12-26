From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 26 Dec 2013 09:52:04 +0100
Subject: [Buildroot] [PATCH 1/2] libmpd: change download URL
In-Reply-To: <20131225101547.1c2a0d67@skate>
References: <1387787808-8194-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20131225101547.1c2a0d67@skate>
Message-ID: <52BBEE34.6050707@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

> Dear Jerzy Grzegorek,
>
> On Mon, 23 Dec 2013 09:36:47 +0100, Jerzy Grzegorek wrote:
>> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>> ---
>>   package/libmpd/libmpd.mk |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
>> index b78a36f..7df8c2a 100644
>> --- a/package/libmpd/libmpd.mk
>> +++ b/package/libmpd/libmpd.mk
>> @@ -5,7 +5,7 @@
>>   ################################################################################
>>   
>>   LIBMPD_VERSION = 11.8.17
>> -LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8.16
>> +LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8
> I had a look, and both of these URLs point to the same thing. Is this
> fixing something specific, or just done for consistency reason because
> we download the 11.8.17 version from a directory named 11.8.16 ?

Yes, this is only for consistency reason.

Regards,
Jerzy

>
> Thanks!
>
> Thomas
