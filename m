From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 13 Feb 2014 23:26:40 +0100
Subject: [Buildroot] [PATCH 1/2] nut: disable hal
In-Reply-To: <20140213213800.GA3259@free.fr>
References: <1392326275-25992-1-git-send-email-romain.naour@openwide.fr>
 <20140213213800.GA3259@free.fr>
Message-ID: <52FD46A0.8020706@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Peter, All,

Le 13/02/2014 22:38, Yann E. MORIN a ?crit :
> Romain, All,
>
> On 2014-02-13 22:17 +0100, Romain Naour spake thusly:
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>   package/nut/nut.mk | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/nut/nut.mk b/package/nut/nut.mk
>> index 04b2b41..47367e1 100644
>> --- a/package/nut/nut.mk
>> +++ b/package/nut/nut.mk
>> @@ -85,4 +85,6 @@ else
>>   NUT_CONF_OPT += --without-ssl
>>   endif
>>   
>> +NUT_CONF_OPT += --without-hal
> I don't care much where this ends up, but we already have a NUT_CONF_OPT
> at the top of the file, so maybe it;d be better to move it there.
>
> Regards,
> Yann E. MORIN.
>
I was preparing the v2 patch.
Thanks Peter :)

Romain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140213/5f4d1ab3/attachment.html>
