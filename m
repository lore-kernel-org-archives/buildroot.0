From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 06 Dec 2013 12:14:46 +0100
Subject: [Buildroot] [PATCH 1/1] git: bump to version 1.8.5
In-Reply-To: <20131206105322.GC4252@tarshish>
References: <1386325661-5288-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20131206105322.GC4252@tarshish>
Message-ID: <52A1B1A6.3090401@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Baruch,
> Hi Jerzy,
>
> On Fri, Dec 06, 2013 at 11:27:41AM +0100, Jerzy Grzegorek wrote:
>> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>> ---
>>   package/git/git.mk |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/git/git.mk b/package/git/git.mk
>> index 58455b1..f660cdb 100644
>> --- a/package/git/git.mk
>> +++ b/package/git/git.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -GIT_VERSION         = 1.8.4.1
>> +GIT_VERSION         = 1.8.5
> Why not 1.8.5.1?
>
> baruch

Thanks for the feedback.
O.K. I'll resend.

Regards,
Jerzy


>
>>   GIT_SITE            = http://git-core.googlecode.com/files/
>>   GIT_LICENSE         = GPLv2 LGPLv2.1+
>>   GIT_LICENSE_FILES   = COPYING LGPL-2.1
>> -- 
>> 1.7.9.5
